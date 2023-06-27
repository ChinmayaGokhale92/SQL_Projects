create database loans_db_assg;

/*customers_csv and loans_data_csv*/

use loans_db_assg;

select * from loans_data_csv limit 10;

alter table loans_data_csv
add column AppDate date;

select str_to_date(ApplicationDate,"%d-%m-%y"), AppDate
from loans_data_csv;

update loans_data_csv
set AppDate=str_to_date(ApplicationDate,"%d-%m-%y");

set sql_safe_updates=0

select * from loans_data_csv;

select date_format(AppDate,"%d-%m-%y")
from loans_data_csv;

