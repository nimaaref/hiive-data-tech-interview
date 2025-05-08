-- Analysis: Execution Team Business Questions
-- Provided for easy copy/paste for business teams.
-- This file includes example queries answering:
-- 1. When a transaction closed
-- 2. Avg open time by month
-- 3. Most common termination reasons
-- 4. Highest gross proceeds per transfer method

-- Queries:
-- 1. When a transaction closed

select
  date_trunc('month', closed_at) as month,
  avg(days_open) as avg_days_open
from fct_transactions
where transaction_status = 'inactive' and closed_at is not null
group by month
order by month;

-- 2. Avg open time by month

select
  date_trunc('month', inserted_at) as month,
  avg(days_open) as avg_days_open
from fct_transactions
group by month
order by month;

-- 3. Most common termination reasons

select
  dtr.termination_reason,
  count(ftr.transaction_id) as reason_count
from fct_transaction_termination_reasons ftr
inner join dim_termination_reason dtr
on dtr.termination_reason_id = ftr.termination_reason_id
group by dtr.termination_reason
order by reason_count desc;

-- 4. Highest gross proceeds per transfer method
select
  transfer_method,
  sum(gross_proceeds) as gross_proceeds
from fct_transactions
group by transfer_method
order by gross_proceeds desc;
