with reasons as (
    select
        transaction_id,
        termination_reason
    from {{ ref('stg_termination_reasons') }}
    where termination_reason is not null
),

reason_ids as (
    select
        termination_reason_id,
        termination_reason
    from {{ ref('dim_termination_reason') }}
)

select
    r.transaction_id,
    d.termination_reason_id,
from reasons r
inner join reason_ids d
    on r.termination_reason = d.termination_reason

