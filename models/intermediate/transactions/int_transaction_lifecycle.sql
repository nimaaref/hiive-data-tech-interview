with opens as (
  select
    transaction_id,
    min(transitioned_at)  as opened_at
  from {{ ref('stg_transactions_transitions') }}
  group by transaction_id
),

closes as (
  select
    transaction_id,
    max(transitioned_at)  as closed_at
  from {{ ref('stg_transactions_transitions') }}
  where transaction_status = 'inactive'
  group by transaction_id
)

select
  o.transaction_id,
  o.opened_at,
  c.closed_at,
  date_diff('day', o.opened_at, coalesce(closed_at,CURRENT_DATE)) as days_open
from opens o
left join closes c
  on o.transaction_id = c.transaction_id
