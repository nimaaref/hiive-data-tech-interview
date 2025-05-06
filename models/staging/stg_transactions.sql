with transactions as (
select * from {{ ref('transactions_seed') }}
)

select 

    id as transaction_id, 
    bid_id, 
    state, 
    CASE
        WHEN state IN ('cancelled', 'expired', 'closed_paid', 'approval_declined') THEN 'inactive'
        ELSE 'open'
    END AS transaction_status,
    transfer_method, 
    cast(inserted_at as timestamp) as inserted_at, 
    company_id, 
    num_shares, 
    price_per_share, 
    gross_proceeds, 
    _fivetran_deleted, 
    _fivetran_synced

from transactions
where _fivetran_deleted = FALSE 