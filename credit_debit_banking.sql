use banking_data;
select * from credit_debit;

-- Total credit amount
select format(sum(amount),2) as total_credit_amount from credit_debit where `transaction type` = "credit";

-- Total debit amount
select format(sum(amount),2) as total_credit_amount from credit_debit where `transaction type` = "debit";

-- Credit to debit ratio
select format(sum(case when `transaction type`='credit'then amount else 0 end) / 
sum(case when `transaction type`='debit' then amount else 0 end),2) as credit_to_debit_ratio from credit_debit;

-- Net transaction amount
select format(sum(case when `transaction type`='credit' then amount else 0 end) -
sum(case when `transaction type`='debit' then amount else 0 end),2) as net_transaction_amount from credit_debit;

-- Account activity ratio
select count(*)/ nullif(sum(balance),0) as account_activity_ratio from credit_debit;

-- Transactions per day
select date(`transaction date`) as date,count(*) as total_transaction_per_day,
sum(amount) as total_transaction_amount_per_day from credit_debit group by date(`transaction date`);

-- Branch wise transaction amount
select branch,format(sum(amount),2) as branch_wise_transaction_amount from credit_debit group by branch;

-- Bank wise transaction amount
select `bank name`,format(sum(amount),2) as bank_wise_transaction_amount from credit_debit group by `bank name`;
