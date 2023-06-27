create database webanalytics_db;

use webanalytics_db;

alter table visitdata
add column NewDOB date;

set sql_safe_updates=0;

alter table visitdata
drop column NewDOB;

alter table visitorprofile_new
add column NewDOB date;

update visitorprofile_new
set NewDOB = str_to_date(DOB, "%d-%M-%Y");

select VistID, timestampdiff(year, NewDOB, current_date()) as age
from visitorprofile_new;

select VistID, Time_Spent, Weekday
from visitdata
where Weekday = "saturday" or Weekday = "sunday"
order by Time_Spent desc
limit 10;

select VistID, Month, Clicked
from visitdata
where Month = "January" and Clicked = "Yes";

select visitdata.VistID, visitdata.Time_Spent, visitorprofile_new.Country_Name
from visitdata, visitorprofile_new
where visitorprofile_new.Country_Name = "Singapore"
order by visitdata.Time_Spent desc
limit 5;



