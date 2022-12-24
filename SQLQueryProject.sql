select *
from dbo.TimeSpent

-- Looking at time spent per project YEARLY 

select distinct Project,
sum(MonthTotalHours) as TotalHours
from dbo.TimeSpent
group by Project
order by TotalHours desc 

-- Looking at time spent per project MONTHLY

select Project, 
Date, 
MonthTotalHours
from dbo.TimeSpent
order by Project, MonthTotalHours desc 

--


select Project, 
Date, 
MonthTotalHours, 
--sum(monthtotalhours) over (partition by project) as Hourstotal,
MonthTotalHours/sum(monthtotalhours) over (partition by project)*100 as Projectpercentage
from dbo.TimeSpent
order by Project, Projectpercentage desc

--
