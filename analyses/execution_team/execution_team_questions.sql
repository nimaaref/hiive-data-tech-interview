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
  date_trunc('month', opened_at) as month,
  avg(days_open) as avg_days_open
from fact_tranactions
group by month
order by month

-- 2. Avg open time by month

select
  date_trunc('month', opened_at) as month,
  avg(days_open) as avg_days_open
from fact_tranactions
group by month
order by month

-- 3. Most common termination reasons
select
    termination_reason,
  count(transaction_id) as reason_count
from stg_termination_reasons
group by termination_reason
order by reason_count desc

-- 4. Highest gross proceeds per transfer method
select
  transfer_method,
  sum(gross_proceeds) as gross_proceeds
from fact_trasactions
group by transfer_method
order by gross_proceeds desc
