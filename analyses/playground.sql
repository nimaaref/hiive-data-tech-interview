
-- desc table {{ ref('transactions_seed') }}

SELECT _FIVETRAN_SYNCED > current_date
FROM {{ ref('transactions_seed') }}
