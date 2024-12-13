# Data description

To answer the first task, we have provided mocked samples of raw data.

## Transactions

The `transactions` table contains information about transactions, and contains the following columns:

- `id`: The unique identifier of the transaction.
- `bid_id`: The unique identifier of the accepted bid associated with the transaction.
- `state`: The current state of the transaction. Transactions in cancelled, expired, closed_paid, approval_declined states are no longer "active".
- `transfer_method`: The method of transfer of the transaction.
- `inserted_at`: When the transaction record was created.
- `company_id`: The unique identifier of the issuing company of the shares.
- `num_shares`: The number of shares associated with each transaction.
- `price_per_share`: The price per share of the transaction.
- `gross_proceeds`: The revenue value of the transaction (number of shares multiplied by the price per share).
- `_fivetran_deleted`: The value is TRUE when the record has been soft deleted in the production database. The value is false otherwise.
- `_fivetran_synced`: When the record was synced to the data warehouse.

## Transaction transitions

The `transaction_transitions` table contains information about how transactions move through various states (acts as a log table).
This data can be used to identify when transactions entered and exited specific states (e.g. when a transaction closed).
It contains the following columns:

- `id`: The unique identifier of the transaction transition.
- `transaction_id`: The unique identifier of the transaction.
- `transitioned_at`: When the transaction moved into a new state.
- `new_state`: The new state the transaction moved into.
- `_fivetran_deleted`: The value is TRUE when the record has been soft deleted in the production database. The value is false otherwise.
- `_fivetran_synced`: When the record was synced to the data warehouse.

## Termination reasons

The `transaction_termination_reasons` table contains information about why transactions were terminated. This table contains rows for each reason.

- `transaction_id`: The identifier of the transaction.
- `Termination_reason`: The reason(s) a transaction was terminated.
