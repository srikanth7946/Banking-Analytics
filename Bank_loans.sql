use banking_data;
select * from  bank_loans;

-- Total Loan Amount
select format(sum(`Loan Amount`),2) as total_loan_amount from bank_loans;

-- Average intrest rate
select format(avg(`int rate`),2) as average_intrest from bank_loans;

-- Total priciple amount recovered
select format(sum(`total rec prncp`),2) as total_priciple_amount_recovered from bank_loans;

-- Total recovered intrest
select format(sum(`total rrec int`),2) as total_intrest_recovered from bank_loans;

-- count of default loan
select count(*) as default_loan_count from bank_loans where `is default loan` = 'y';

-- Delinquent client count
select count(*) as delinquent_client_count from bank_loans where `is delinquent loan`='y';

-- Branch wise Revenue
select `branch name`,format((sum(`total rrec int`) +
sum(`total fees`) +
 sum(`total rec late fee`)),2) as branch_wise_revenue from bank_loans group by `branch name`;

-- year wise loan
select `disbursement date (years)`,format(sum(`loan amount`),2) as year_wise_loan from bank_loans group by `disbursement date (years)` order by `disbursement date (years)`;

-- state wise loan
select `state name`,format(sum(`loan amount`),2) as state_wise_loan from bank_loans group by `state name` order by sum(`loan amount`) desc;

-- Religion wise loan
select `religion`,format(sum(`loan amount`),2)as religion_wise_loan from bank_loans group by `religion`;

-- prduct wise loan
select `product code`,format(sum(`loan amount`),2) as product_wise_loan from bank_loans group by `product code` ;

-- Grade wise loan
select grrade,format(sum(`loan amount`),2) as grade_wise_loan from bank_loans group by grrade;

-- Age wise loan
select  age,format(sum(`loan amount`),2) as age_wise_loan from bank_loans group by age order by age;

-- loan status wise
select `loan status`,format(sum(`loan amount`),2) as loan_status_wise from bank_loans group by `loan status`;   

-- pupose category wise loan
select  `purpose category`,format(sum(`loan amount`),2) as purpose_category from bank_loans group by `purpose category` order by sum(`loan amount`)desc;

-- Bank wise loan
select `bank name`,format(sum(`loan amount`),2) as bank_wise_loan from bank_loans group by `bank name`;



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



