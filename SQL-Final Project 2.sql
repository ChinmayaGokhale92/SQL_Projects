create database project;

use project;

/*Q1-CREATE_Station*/
create table station
(ID Int,
CITY char(20) not null,
STATE char(2),
LAT_N int,
LONG_W int);

/*Q2-INSERT_Station*/
Insert station (
ID, CITY, STATE, LAT_N, LONG_W)
value 
('13', 'Phoenix', 'AZ', '33', '112'),
('44', 'Denver', 'CO', '44', '105'),
('66', 'Caribou', 'ME', '47', '68');

/*Q3-Look at table STATION in undefined order*/
select *
from station;

/*Q4-SELECT_Northern Station*/
select ID, CITY, STATE
from station
where LAT_N > 39.7;

/*Q5-CREATE_STATS*/
 create table STATS
(ID Int,
MONTH INT,
TEMP_F varchar(2),
RAIN_I varchar(2);

/*Q6-INSERT_STATS*/
Insert STATS (
ID, MONTH, TEMP_F, RAIN_I)
value 
('13', '1', '57.4', '0.31'),
('13', '7', '91.7', '5.15'),
('44', '1', '27.3', '0.18'),
('44', '7', '74.8', '2.11'),
('66', '1', '6.7', '2.1'),
('66', '7', '65.8', '4.52');

Alter table stats
Drop column LONG_W;

/*Q7-Display tmperature stats*/
Select station.ID, TEMP_F, CITY
from station, stats
where station.ID = stats.ID;

/*Q8-Select_Table STATS, ORDER BY MONTH & GREATEST RAINFALL*/
Select CITY, MONTH, RAIN_I
from station, stats
where station.ID = stats.ID
order by RAIN_I DESC, MONTH DESC;

/*Q9-Select_temperatures for July, lowest temp first*/
select TEMP_F, CITY, LAT_N
from station, stats
where MONTH = 7 and station.ID = stats.ID
order by TEMP_F asc;

/*Q10-Max & Min temperatures and avg rainfall for each city*/
select CITY, max(TEMP_F), min(TEMP_F), avg(RAIN_I)
from station, stats
where station.ID = stats.ID;

/*Q11-To display monthly temperature in Celsius and rainfall for each city in centimeter*/
select CITY, ((TEMP_F-32)*0.5556) as TEMP_C, (RAIN_I*2.54) as RAIN_C
from station, stats
where station.ID = stats.ID;

/*Q12-Update all rows of table STATS to compensate for faulty rain gauges known to read 0.01*/
update stats
set RAIN_I = cast(RAIN_I as decimal(6,2)), TEMP_F = cast(TEMP_F as decimal(6,2));

/*Q13-Update Denver's July temperature reading as 74.9*/
Alter stats
update TEMP_F = 74.9
where MONTH = 7 and city = denver;
 









