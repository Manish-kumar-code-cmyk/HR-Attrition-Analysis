create database HR_Attrition_analysis;
use HR_Attrition_analysis;
-- Attrition analysis 
select * from employee_attrition;

alter table employee_attrition
modify Attrition varchar(50),
modify BusinessTravel varchar(50),
modify Department varchar(50),
modify EducationField varchar(50),
modify Gender varchar(50),
modify JobRole varchar(50),
modify MaritalStatus varchar(50),
modify OverTime varchar(50);

alter table employee_attrition 
rename column ï»¿Age to Age;

-- Total employee..
select count(age) as total_emoloyee 
from employee_attrition;

-- Total count and percent of attrition yes and no ..
select attrition, count(attrition),
round(count(attrition) /(select count(attrition) from employee_attrition)*100,2) as percentage
from employee_attrition
group by attrition;

-- Average_salary
select round(avg(MonthlyIncome),2)
 from employee_attrition;
 
 -- Department wise Employee
 select department, count(age) as Total_employee
 from employee_attrition
 group by department;
 
 -- Attrition %(rate) and Total count per department
 select department, count(attrition), attrition,
 round(count(attrition)/(select count(attrition) from employee_attrition)*100,2) as percent_of_attrition
 from employee_attrition 
 group by department,attrition;
 
 -- Department wise salary 
 select JobRole, round(avg(Monthlyincome),2)as Salary
 from employee_attrition 
 group by JObRole;
 
 -- Total count of attrition age group wise..
 select count(attrition) as total_employee, attrition,
 case 
 when age<= 30 then"young age "
 when age<=45 then "MIddle"
 else "old"
 end as "age_group"
 from employee_attrition
 group by age_group,attrition;
 
 -- Gender wise attrition count 
 select attrition, gender,count(gender) as total_employee
 from employee_attrition 
 group by attrition, gender;
 
 -- no. of more than average salary.
 select  count(age) as no_of_employee
 from employee_attrition 
 where MOnthlyincome > (select avg(MonthlyIncome)from employee_attrition) ;
 
 
 -- salary bucket of employees
select count(*) as no_of_employee,
case 
when monthlyincome <=7000 then "low"
when monthlyincome <= 15000 then "medium" 
else "high"
end as salary_categories ,
round(count(*)/ (select count(*) from employee_attrition)*100,2) as percent
from employee_attrition
group by salary_categories;


-- Average years in company by department 
select department , round(avg(yearsatcompany),2)as avg_years
from employee_attrition
group by department
order by avg_years desc;

-- count no. of employees who stayed longer than average
select jobrole, count(*) as no_of_employees
from employee_attrition 
where yearsatcompany> (select avg(yearsatcompany) from employee_attrition)
group by jobrole 
order by no_of_employees desc;


-- job role with highest attrition 
select jobrole,attrition,count(attrition) as total_attrition
from employee_attrition
group by jobrole,attrition
order by total_attrition desc;

-- Attrition and overtime..
select overtime, attrition,count(*) as total_employee
from employee_attrition 
group by overtime,attrition;

-- highperformance and attrition
select performancerating , attrition ,count(attrition) as total_attrition
from employee_attrition 
group by performancerating , attrition 
order by total_attrition desc;

-- promotion gap 
select YearsSinceLastPromotion,attrition,count(*) as total_attrition
from employee_attrition 
group by YearsSinceLastPromotion,attrition
order by attrition;

-- enviromental satisfaction 
select EnvironmentSatisfaction, Attrition ,count(*)as total_Attrition 
from employee_attrition 
group by  EnvironmentSatisfaction, Attrition 
order by attrition;

-- distancefromhome 
select distancefromhome, attrition,count(*) as total_attrition 
from employee_attrition 
group by distancefromhome, attrition
order by attrition;

-- monthly income 
select  case 
when monthlyincome<=7000 then "low"
when monthlyincome <= 1500 then "medium"
else "high" end as salary_bucket,
attrition, count(*) as total_attrition
from employee_attrition 
group by salary_bucket,attrition
order by attrition;

-- salary hike 
select PercentSalaryHike, attrition,count(*) as total_attrition 
from employee_attrition 
group by PercentSalaryHike, attrition
order by attrition;

-- TrainingTimesLastYear
select TrainingTimesLastYear, attrition,count(*) as total_attrition 
from employee_attrition 
group by TrainingTimesLastYear, attrition
order by attrition;


-- WorkLifeBalance
select WorkLifeBalance, attrition,count(*) as total_attrition 
from employee_attrition 
group by WorkLifeBalance, attrition
order by attrition;
