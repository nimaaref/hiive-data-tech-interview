with transactions_transitions as (
select * from {{ ref('transaction_transitions_seed') }}
)

select 
    id as transaction_transition_id, 
    transaction_id, 
    cast(transitioned_at as TIMESTAMP) as transitioned_at, 
    new_state, 
    CASE 
        WHEN new_state IN ('cancelled', 'expired', 'closed_paid', 'approval_declined') THEN 'inactive'
        ELSE 'open'
    END AS transaction_status,
    _fivetran_deleted, 
    _fivetran_synced
from transactions_transitions
where _fivetran_deleted = FALSE
