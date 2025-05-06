with termination_reasons as (
select * from {{ ref('transaction_termination_reasons_seed') }}

)

select 
    transaction_id, 
    termination_reason
from termination_reasons