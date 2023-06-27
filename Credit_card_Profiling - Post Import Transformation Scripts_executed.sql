create database customer_profiling_cc;

use customer_profiling_cc;

show tables;

select * from credit_card_profile_data_csv
limit 10;

select AnnualSalary
from credit_card_profile_data_csv;

select replace(AnnualSalary,",","")*1,
cast(replace(AnnualSalary,",","")as unsigned)
from credit_card_profile_data_csv;

alter table credit_card_profile_data_csv
add column salary int;

set sql_safe_updates=0;

update credit_card_profile_data_csv
set salary = cast(replace(AnnualSalary,",","")as unsigned);

select salary
from credit_card_profile_data_csv;

alter table credit_card_profile_data_csv
drop column AnnualSalary;

alter table credit_card_profile_data_csv
rename column `Number of Credit Cards` to NoofCC;

alter table credit_card_profile_data_csv
drop column salary_new;