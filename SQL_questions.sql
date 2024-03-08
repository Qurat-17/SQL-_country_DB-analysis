use world;
select * from country;


# Q!. determine the  sum of surface area per continent?

SELECT continent,  sum(SurfaceArea) surfacearea
FROM country
group by Continent;


# Q2. Find the average life expectancy by region ?

SELECT continent,  avg(LifeExpectancy) surfacearea
FROM country
group by Continent;


SELECT continent ,region,  avg(LifeExpectancy) surfacearea
FROM country
group by Continent,region  order by SurfaceArea desc
 limit 10; 
 

 
 #Q3. count the total number of countries in a continent?
 
 SELECT continent,  count(country_name) 
FROM country
group by Continent;


#Q4. Categorize the countries as per popuation  density  as LPD, HPD,MPD?


  # --- Categorize the countries as per popuation  density  as LPD, HPD,MPD
  # --- but we  don't have the population density column
  # ----Pd= population / surfaceArea

select min(Population/SurfaceArea)as min, max(Population/SurfaceArea)as max from country;
# LPD <=2000 ;
# 2000> MPD < 15000 ;
# HPd >15000 ;

select country_name , continent,(Population/SurfaceArea) as PD , 
case 
when Population/SurfaceArea <= 2000 then 'LPD'
when Population/SurfaceArea > 2000 and (Population/SurfaceArea ) < 15000 then 'MPD'
else 'HPD' end as population_category
from country;




#Q5.  Find the average GNP  by region ?


SELECT region,  avg(LifeExpectancy) surfacearea
FROM country
group by region;




#Q6. categorie countries  as under developed , developed , deveoping
select country_Name ,Continent,
 case 
 when GNP <= 1000000 then 'Under_developed '
 when GNP> 1000000 and GNP <= 4500000 then 'Developing'
 else 'Developed'  end  as country_category
 from country where case 
 when GNP <= 1000000 then 'Under_developed '
 when GNP> 1000000 and GNP <= 4500000 then 'Developing'
 else 'Developed'  end
 ='Developing' ;
 
 
 
 
 #Q7. Aggregate functions ?
 
 select Continent,
 sum(SurfaceArea) as Total_surface_Area, 
 sum(Population) as Total_pop ,
avg(LifeExpectancy) as avgLifeExpectancy, 
sum(GNP) as Total_GNP from country 
      group by Continent ;
      
      
# Built in functions 
# 1. STRING FUN
#  a) concat
use world ;
select* from country;
select name , localname ,concat(name ," -", continent) as Big_name from country ;
# b) UPper
select name , localname ,upper(continent) as Big_name from country ;
# c) lower
select name , localname,continent ,lower(continent) as Big_name from country ;
# d) length
select name , localname,continent ,length(continent) as l1 from country ;
# e) substring
select name , region , substring(Continent ,1,5) as sub from country;

# 2. Numerical 

#a) abs 
select abs(GNP) as GNP from country;
select* from country;

select *, round(Surfacearea,2)as SurfaceArea  from country;
select LifeExpectancy, ceil(LifeExpectancy)as LE  from country;
select LifeExpectancy, floor(LifeExpectancy)as LE  from country;
select LifeExpectancy, abs(sqrt(LifeExpectancy))as LE  from country;
select LifeExpectancy, exp(LifeExpectancy)as LE  from country;
select LifeExpectancy, log(LifeExpectancy)as LE  from country;

#3 . Date andtime 
use sys;
select * from sys_config;
select set_time,year(set_time )as year,monthname(set_time )as month ,dayname(set_time)as day from sys_config;
select set_time,month(set_time )as month from sys_config;
select set_time,monthname(set_time )as month from sys_config;

select set_time,dayname(set_time)as day from sys_config;
select set_time,day(set_time)as day from sys_config;

select set_time,time(set_time)as time from sys_config;
select set_time, hour(set_time)as hour from sys_config;
select set_time, second(set_time)as sec from sys_config;
select set_time,datediff(current_date,set_time) from sys_config;


 








      
      
      



 