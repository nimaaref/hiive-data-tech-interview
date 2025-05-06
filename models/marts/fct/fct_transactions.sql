with transactions as (
  select *
  from {{ ref('stg_transactions') }}
),

lifecycle as (
  select *
  from {{ ref('int_transaction_lifecycle') }}
)

select
  t.transaction_id,
  t.bid_id,
  t.company_id,
  t.transfer_method,
  t.state,
  t.transaction_status,
  t.inserted_at,
  l.closed_at,
  l.days_open,
  t.num_shares,
  t.price_per_share,
  coalesce(t.gross_proceeds, t.num_shares * t.price_per_share) as gross_proceeds
from transactions t
left join lifecycle l on t.transaction_id = l.transaction_id
