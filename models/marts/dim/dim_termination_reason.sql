with distinct_reasons as (
    select distinct
        termination_reason
    from {{ ref('stg_termination_reasons') }}
    where termination_reason is not null
)

select
    row_number() over (order by termination_reason) as termination_reason_id,
    termination_reason,
from distinct_reasons
