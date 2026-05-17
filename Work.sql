

use TASK

--COPY DATASET
select * into #temp from [dbo].[Data set (2)] 


--TOTAL NULL COUNTS IN THE DATASET
SELECT COUNT(*) FROM #TEMP WHERE Coal_RB_4800_FOB_London_Close_USD is null and 
        Coal_RB_5500_FOB_London_Close_USD is null and 
        Coal_RB_5700_FOB_London_Close_USD is null and 
        Coal_RB_6000_FOB_CurrentWeek_Avg_USD is null and 
        Coal_India_5500_CFR_London_Close_USD is null and 
        Price_WTI is null and Price_Brent_Oil is null and  Price_Dubai_Brent_Oil is null
        and
        Price_ExxonMobil is null and  Price_Shenhua is null and 
        Price_All_Share is null and  Price_Mining is null and 
        Price_LNG_Japan_Korea_Marker_PLATTS is null and 
        Price_ZAR_USD is null and  Price_Natural_Gas is null and
        Price_ICE is null and  Price_Dutch_TTF is null and 
        Price_Indian_en_exg_rate is null


--DETECTING DUPLICATES 

SELECT Coal_RB_4800_FOB_London_Close_USD,
        Coal_RB_5500_FOB_London_Close_USD,
        Coal_RB_5700_FOB_London_Close_USD,
        Coal_RB_6000_FOB_CurrentWeek_Avg_USD,
        Coal_India_5500_CFR_London_Close_USD,
        Price_WTI, Price_Brent_Oil, Price_Dubai_Brent_Oil,
        Price_ExxonMobil, Price_Shenhua,
        Price_All_Share, Price_Mining,
        Price_LNG_Japan_Korea_Marker_PLATTS,
        Price_ZAR_USD, Price_Natural_Gas,
        Price_ICE, Price_Dutch_TTF,
        Price_Indian_en_exg_rate FROM [dbo].[Data set (2)]  GROUP BY Coal_RB_4800_FOB_London_Close_USD,
        Coal_RB_5500_FOB_London_Close_USD,
        Coal_RB_5700_FOB_London_Close_USD,
        Coal_RB_6000_FOB_CurrentWeek_Avg_USD,
        Coal_India_5500_CFR_London_Close_USD,
        Price_WTI, Price_Brent_Oil, Price_Dubai_Brent_Oil,
        Price_ExxonMobil, Price_Shenhua,
        Price_All_Share, Price_Mining,
        Price_LNG_Japan_Korea_Marker_PLATTS,
        Price_ZAR_USD, Price_Natural_Gas,
        Price_ICE, Price_Dutch_TTF,
        Price_Indian_en_exg_rate HAVING COUNT(*) >1;



--1. Coal_RB_4800_FOB_London_Close_USD


-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Coal_RB_4800_FOB_London_Close_USD is null   --39 Missing Values

--Checking that are replaceable with nulls in Ccolumn Coal_RB_4800_FOB_London_Close_USD
select avg(Coal_RB_4800_FOB_London_Close_USD) from #temp

--Filling Missing Values with mean 87.95
update #temp set Coal_RB_4800_FOB_London_Close_USD = 87.95 where Coal_RB_4800_FOB_London_Close_USD is null

--Mean of updated column
select avg(Coal_RB_4800_FOB_London_Close_USD) as Mean_Value  from #temp

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Coal_RB_4800_FOB_London_Close_USD)  over()  as Median_Value from #temp 

--Mode of update column
select top 1 Coal_RB_4800_FOB_London_Close_USD, count(*) as Total_Value_Count  from #temp group by Coal_RB_4800_FOB_London_Close_USD order by count(*) desc 


--Measure of dispersion:

--Variance
select VAR(Coal_RB_4800_FOB_London_Close_USD) as Variance from #temp --2158.71

--Standard Deviation
select STDEVP(Coal_RB_4800_FOB_London_Close_USD) from #temp --46.44

--Skewness
with  A as(
select cast(Coal_RB_4800_FOB_London_Close_USD as float) as x from #temp
where Coal_RB_4800_FOB_London_Close_USD is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --1.33


--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Coal_RB_4800_FOB_London_Close_USD as float) as x,
       avg(Coal_RB_4800_FOB_London_Close_USD) over() as avg_value
       from #temp
       where Coal_RB_4800_FOB_London_Close_USD is not null ) as t; --2.28 




--2. Coal_RB_5500_FOB_London_Close_USD


-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Coal_RB_5500_FOB_London_Close_USD is null   --39 Missing Values

--Checking that are replaceable with nulls in Ccolumn Coal_RB_5500_FOB_London_Close_USD
select avg(Coal_RB_5500_FOB_London_Close_USD) from #temp -- 113.35

--Filling Missing Values with mean 113.35
update #temp set Coal_RB_5500_FOB_London_Close_USD = 113.35 where Coal_RB_5500_FOB_London_Close_USD is null

--Mean of updated column
select avg(Coal_RB_5500_FOB_London_Close_USD) as Mean_Value  from #temp -- 113.35

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Coal_RB_5500_FOB_London_Close_USD)  over()  as Median_Value from #temp -- 97.27

--Mode of update column
select top 2 Coal_RB_5500_FOB_London_Close_USD, count(*) as Total_Value_Count  from #temp group by Coal_RB_5500_FOB_London_Close_USD order by count(*) desc -- 113.35


--Measure of dispersion:

--Variance
select VAR(Coal_RB_5500_FOB_London_Close_USD) as Variance from #temp --3841.86

--Standard Deviation
select STDEVP(Coal_RB_5500_FOB_London_Close_USD) from #temp --61.95

--Skewness
with  A as(
select cast(Coal_RB_5500_FOB_London_Close_USD as float) as x from #temp
where Coal_RB_5500_FOB_London_Close_USD is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --1.27


--Kurtosis
select sum(power(x-avg_value,4))/count(*) / (power(sum(power(x-avg_value,2))/count(*),2)) - 3 as kurtosis from (
select cast(Coal_RB_5500_FOB_London_Close_USD as float ) as x,
avg(Coal_RB_5500_FOB_London_Close_USD) over() as avg_value
from #temp where Coal_RB_5500_FOB_London_Close_USD is not null) t;  --1.26




--3. Coal_RB_5700_FOB_London_Close_USD

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Coal_RB_5700_FOB_London_Close_USD is null   --44 Missing Values

--Checking that are replaceable with nulls in column Coal_RB_5700_FOB_London_Close_USD
select avg(Coal_RB_5700_FOB_London_Close_USD) from #temp -- 135.17

--Filling Missing Values with mean 
update #temp set Coal_RB_5700_FOB_London_Close_USD = 135.17  where Coal_RB_5700_FOB_London_Close_USD is null

--Mean of updated column
select avg(Coal_RB_5700_FOB_London_Close_USD) as Mean_Value  from #temp --135.17

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Coal_RB_5700_FOB_London_Close_USD)  over()  as Median_Value from #temp --111.5

--Mode of update column
select top 1 Coal_RB_5700_FOB_London_Close_USD, count(*) as Total_Value_Count  from #temp group by Coal_RB_5700_FOB_London_Close_USD order by count(*) desc --135.17


--Measure of dispersion:

--Variance
select VAR(Coal_RB_5700_FOB_London_Close_USD) as Variance from #temp --5781.54

--Standard Deviation
select STDEVP(Coal_RB_5700_FOB_London_Close_USD) from #temp --76.00

--Skewness
with  A as(
select cast(Coal_RB_5700_FOB_London_Close_USD as float) as x from #temp
where Coal_RB_5700_FOB_London_Close_USD is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --1.29

--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Coal_RB_5700_FOB_London_Close_USD as float) as x,
       avg(Coal_RB_5700_FOB_London_Close_USD) over() as avg_value
       from #temp
       where Coal_RB_5700_FOB_London_Close_USD is not null ) as t; --0.93



--4. Coal_RB_6000_FOB_CurrentWeek_Avg_USD

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Coal_RB_6000_FOB_CurrentWeek_Avg_USD is null   --23 Missing Values

--Checking value that are replaceable with nulls in column Cal_RB_6000_FOB_CurrentWeek_Avg_USD
select avg(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) from #temp --144.35

--Filling Missing Values with mean 144.35
update #temp set Coal_RB_6000_FOB_CurrentWeek_Avg_USD = 144.35 where Coal_RB_6000_FOB_CurrentWeek_Avg_USD is null

--Mean of updated column
select avg(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) as Mean_Value  from #temp --144.35

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Coal_RB_6000_FOB_CurrentWeek_Avg_USD)  over()  as Median_Value from #temp --115.62

--Mode of update column
select top 1 Coal_RB_6000_FOB_CurrentWeek_Avg_USD, count(*) as Total_Value_Count  from #temp group by Coal_RB_6000_FOB_CurrentWeek_Avg_USD order by count(*) desc --144.35


--Measure of dispersion:

--Variance
select VAR(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) as Variance from #temp --6827.28

--Standard Deviation
select STDEVP(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) from #temp --82.59

--Skewness
with  A as(
select cast(Coal_RB_6000_FOB_CurrentWeek_Avg_USD as float) as x from #temp
where Coal_RB_6000_FOB_CurrentWeek_Avg_USD is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value --1.27

--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Coal_RB_6000_FOB_CurrentWeek_Avg_USD as float) as x,
       avg(Coal_RB_6000_FOB_CurrentWeek_Avg_USD) over() as avg_value
       from #temp
       where Coal_RB_6000_FOB_CurrentWeek_Avg_USD is not null ) as t; --0.78



--5. Coal_India_5500_CFR_London_Close_USD

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Coal_India_5500_CFR_London_Close_USD is null   --39 Missing Values

--Checking value that are replaceable with nulls in column Coal_India_5500_CFR_London_Close_USD
select avg(Coal_India_5500_CFR_London_Close_USD) from #temp --123.75

--Filling Missing Values with mean 123.75
update #temp set Coal_India_5500_CFR_London_Close_USD = 123.75 where Coal_India_5500_CFR_London_Close_USD is null

--Mean of updated column
select avg(Coal_India_5500_CFR_London_Close_USD) as Mean_Value  from #temp --123.75

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Coal_India_5500_CFR_London_Close_USD)  over()  as Median_Value from #temp --111.68

--Mode of update column
select top 1 Coal_India_5500_CFR_London_Close_USD, count(*) as Total_Value_Count  from #temp group by Coal_India_5500_CFR_London_Close_USD order by count(*) desc --123.75


--Measure of dispersion:

--Variance
select VAR(Coal_India_5500_CFR_London_Close_USD) as Variance from #temp --3079.91

--Standard Deviation
select STDEVP(Coal_India_5500_CFR_London_Close_USD) from #temp --55.47

--Skewness
with  A as(
select cast(Coal_India_5500_CFR_London_Close_USD as float) as x from #temp
where Coal_India_5500_CFR_London_Close_USD is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value --0.87

--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Coal_India_5500_CFR_London_Close_USD as float) as x,
       avg(Coal_India_5500_CFR_London_Close_USD) over() as avg_value
       from #temp
       where Coal_India_5500_CFR_London_Close_USD is not null ) as t; --0.28



--6. Price_WTI

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_WTI is null   --8 Missing Values

--Checking value that are replaceable with nulls in column Price_WTI
select avg(Price_WTI) from #temp --72.34

--Filling Missing Values with mean 72.34
update #temp set Price_WTI = 72.34 where Price_WTI is null

--Mean of updated column
select avg(Price_WTI) as Mean_Value  from #temp --72.34

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_WTI)  over()  as Median_Value from #temp --75.56

--Mode of update column
select top 1 Price_WTI, count(*) as Total_Value_Count  from #temp group by Price_WTI order by count(*) desc --72.34


--Measure of dispersion:

--Variance
select VAR(Price_WTI) as Variance from #temp --421.51

--Standard Deviation
select STDEVP(Price_WTI) from #temp --20.52

--Skewness
with  A as(
select cast(Price_WTI as float) as x from #temp
where Price_WTI is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value --  -0.53

--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Price_WTI as float) as x,
       avg(Price_WTI) over() as avg_value
       from #temp
       where Price_WTI is not null ) as t;  --0.82



--7. Price_Brent_Oil

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_Brent_Oil is null   --11 Missing Values

--Checking value that are replaceable with nulls in column Price_Brent_Oil
select avg(Price_Brent_Oil) from #temp --76.28

--Filling Missing Values with mean 76.28
update #temp set Price_Brent_Oil = 76.28 where Price_Brent_Oil is null

--Mean of updated column
select avg(Price_Brent_Oil) as Mean_Value  from #temp --76.28

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_Brent_Oil)  over()  as Median_Value from #temp --79.66

--Mode of update column
select top 1 Price_Brent_Oil, count(*) as Total_Value_Count  from #temp group by Price_Brent_Oil order by count(*) desc --76.28


--Measure of dispersion:

--Variance
select VAR(Price_Brent_Oil) as Variance from #temp --425.17

--Standard Deviation
select STDEVP(Price_Brent_Oil) from #temp --20.61

--Skewness
with  A as(
select cast(Price_Brent_Oil as float) as x from #temp
where Price_Brent_Oil is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --  -0.43

--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Price_Brent_Oil as float) as x,
       avg(Price_Brent_Oil) over() as avg_value
       from #temp
       where Price_Brent_Oil is not null ) as t;  -- -0.00018






--8. Price_Dubai_Brent_Oil

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_Dubai_Brent_Oil is null   --40 Missing Values

--Checking value that are replaceable with nulls in column Price_Dubai_Brent_Oil
select avg(Price_Dubai_Brent_Oil) from #temp --74.75

--Filling Missing Values with mean 74.75
update #temp set Price_Dubai_Brent_Oil = 74.75 where Price_Dubai_Brent_Oil is null

--Mean of updated column
select avg(Price_Dubai_Brent_Oil) as Mean_Value  from #temp --74.75

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_Dubai_Brent_Oil)  over()  as Median_Value from #temp --78.18

--Mode of update column
select top 1 Price_Dubai_Brent_Oil, count(*) as Total_Value_Count  from #temp group by Price_Dubai_Brent_Oil order by count(*) desc --74.75


--Measure of dispersion:

--Variance
select VAR(Price_Dubai_Brent_Oil) as Variance from #temp --405.28

--Standard Deviation
select STDEVP(Price_Dubai_Brent_Oil) from #temp --20.12

--Skewness
with  A as(
select cast(Price_Dubai_Brent_Oil as float) as x from #temp
where Price_Dubai_Brent_Oil is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --  -0.56


--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Price_Dubai_Brent_Oil as float) as x,
       avg(Price_Dubai_Brent_Oil) over() as avg_value
       from #temp
       where Price_Dubai_Brent_Oil is not null ) as t; --0.067



--9. Price_ExxonMobil

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_ExxonMobil is null   --40 Missing Values

--Checking value that are replaceable with nulls in column Price_ExxonMobil
select avg(Price_ExxonMobil) from #temp --80.87

--Filling Missing Values with mean 80.87
update #temp set Price_ExxonMobil = 80.87 where Price_ExxonMobil is null

--Mean of updated column
select avg(Price_ExxonMobil) as Mean_Value  from #temp --80.87

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_ExxonMobil)  over()  as Median_Value from #temp --84.80

--Mode of update column
select top 1 Price_ExxonMobil, count(*) as Total_Value_Count  from #temp group by Price_ExxonMobil order by count(*) desc --80.87


--Measure of dispersion:

--Variance
select VAR(Price_ExxonMobil) as Variance from #temp --743.38

--Standard Deviation
select STDEVP(Price_ExxonMobil) from #temp --27.25

--Skewness
with  A as(
select cast(Price_ExxonMobil as float) as x from #temp
where Price_ExxonMobil is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --  -0.21

--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Price_ExxonMobil as float) as x,
       avg(Price_ExxonMobil) over() as avg_value
       from #temp
       where Price_ExxonMobil is not null ) as t;  --  -1.42



--10. Price_Shenhua

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_Shenhua is null   --65 Missing Values

--Checking value that are replaceable with nulls in column Price_Shenhua
select avg(Price_Shenhua) from #temp --21.27

--Filling Missing Values with mean 21.27
update #temp set Price_Shenhua = 21.27 where Price_Shenhua is null

--Mean of updated column
select avg(Price_Shenhua) as Mean_Value  from #temp --21.27

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_Shenhua)  over()  as Median_Value from #temp --21.85

--Mode of update column
select top 1 Price_Shenhua, count(*) as Total_Value_Count  from #temp group by Price_Shenhua order by count(*) desc --21.27


--Measure of dispersion:

--Variance
select VAR(Price_Shenhua) as Variance from #temp --35.44

--Standard Deviation
select STDEVP(Price_Shenhua) from #temp --5.95

--Skewness
with  A as(
select cast(Price_Shenhua as float) as x from #temp
where Price_Shenhua is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --0.58

--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Price_Shenhua as float) as x,
       avg(Price_Shenhua) over() as avg_value
       from #temp
       where Price_Shenhua is not null ) as t;  --0.20



--11. Price_All_Share

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_All_Share is null   --49 Missing Values

--Checking value that are replaceable with nulls in column Price_All_Share
select avg(Price_All_Share) from #temp --68736.90

--Filling Missing Values with mean 68736.90
update #temp set Price_All_Share = 68736.90 where Price_All_Share is null

--Mean of updated column
select avg(Price_All_Share) as Mean_Value  from #temp --68736.90

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_All_Share)  over()  as Median_Value from #temp --69401.95

--Mode of update column
select top 1 Price_All_Share, count(*) as Total_Value_Count  from #temp group by Price_All_Share order by count(*) desc --68736.9


--Measure of dispersion:

--Variance
select VAR(Price_All_Share) as Variance from #temp --60078244.7

--Standard Deviation
select STDEVP(Price_All_Share) from #temp --7747.51

--Skewness
with  A as(
select cast(Price_All_Share as float) as x from #temp
where Price_All_Share is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --   -0.83

--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast( Price_All_Share as float) as x,
       avg( Price_All_Share) over() as avg_value
       from #temp
       where  Price_All_Share is not null ) as t;  --0.0082



--12. Price_Mining

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_Mining is null   --49 Missing Values

--Checking value that are replaceable with nulls in column Price_Mining
select avg(Price_Mining) from #temp --52972.17

--Filling Missing Values with mean 52972.17
update #temp set Price_Mining = 52972.17  where Price_Mining is null

--Mean of updated column
select avg(Price_Mining) as Mean_Value  from #temp --52972.17

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_Mining)  over()  as Median_Value from #temp --52972.17

--Mode of update column
select top 1 Price_Mining, count(*) as Total_Value_Count  from #temp group by Price_Mining order by count(*) desc --52972.17


--Measure of dispersion:

--Variance
select VAR(Price_Mining) as Variance from #temp --47333784.6

--Standard Deviation
select STDEVP(Price_Mining) from #temp --6876.84

--Skewness
with  A as(
select cast(Price_Mining as float) as x from #temp
where Price_Mining is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --   -0.29

--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast( Price_Mining as float) as x,
       avg(Price_Mining) over() as avg_value
       from #temp
       where Price_Mining is not null ) as t;  -- -0.244




--13. Price_Mining

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_Mining is null   --49 Missing Values

--Checking value that are replaceable with nulls in column Price_Mining
select avg(Price_Mining) from #temp --52972.17

--Filling Missing Values with mean 52972.17
update #temp set Price_Mining = 52972.17  where Price_Mining is null

--Mean of updated column
select avg(Price_Mining) as Mean_Value  from #temp --52972.17

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_Mining)  over()  as Median_Value from #temp --52972.17

--Mode of update column
select top 1 Price_Mining, count(*) as Total_Value_Count  from #temp group by Price_Mining order by count(*) desc --52972.17


--Measure of dispersion:

--Variance
select VAR(Price_Mining) as Variance from #temp --47333784.6

--Standard Deviation
select STDEVP(Price_Mining) from #temp --6876.84

--Skewness
with  A as(
select cast(Price_Mining as float) as x from #temp
where Price_Mining is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --   -0.29

--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast( Price_Mining as float) as x,
       avg(Price_Mining) over() as avg_value
       from #temp
       where Price_Mining is not null ) as t;  -- -0.244







--14. Price_LNG_Japan_Korea_Marker_PLATTS

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_LNG_Japan_Korea_Marker_PLATTS is null   --41 Missing Values

--Checking value that are replaceable with nulls in column Price_LNG_Japan_Korea_Marker_PLATTS
select avg(Price_LNG_Japan_Korea_Marker_PLATTS) from #temp --17.62

--Filling Missing Values with mean 17.62
update #temp set Price_LNG_Japan_Korea_Marker_PLATTS = 17.62 where Price_LNG_Japan_Korea_Marker_PLATTS is null

--Mean of updated column
select avg(Price_LNG_Japan_Korea_Marker_PLATTS) as Mean_Value  from #temp --17.62

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_LNG_Japan_Korea_Marker_PLATTS)  over()  as Median_Value from #temp --13.33

--Mode of update column
select top 1 Price_LNG_Japan_Korea_Marker_PLATTS, count(*) as Total_Value_Count  from #temp group by Price_LNG_Japan_Korea_Marker_PLATTS order by count(*) desc --17.62


--Measure of dispersion:

--Variance
select VAR(Price_LNG_Japan_Korea_Marker_PLATTS) as Variance from #temp --155.71

--Standard Deviation
select STDEVP(Price_LNG_Japan_Korea_Marker_PLATTS) from #temp --12.47

--Skewness
with  A as(
select cast(Price_LNG_Japan_Korea_Marker_PLATTS as float) as x from #temp
where Price_LNG_Japan_Korea_Marker_PLATTS is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --1.101

--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Price_LNG_Japan_Korea_Marker_PLATTS as float) as x,
       avg(Price_LNG_Japan_Korea_Marker_PLATTS) over() as avg_value
       from #temp
       where Price_LNG_Japan_Korea_Marker_PLATTS is not null ) as t; --0.92



--15. Price_LNG_Japan_Korea_Marker_PLATTS

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_LNG_Japan_Korea_Marker_PLATTS is null   --41 Missing Values

--Checking value that are replaceable with nulls in column Price_LNG_Japan_Korea_Marker_PLATTS
select avg(Price_LNG_Japan_Korea_Marker_PLATTS) from #temp --17.62

--Filling Missing Values with mean 17.62
update #temp set Price_LNG_Japan_Korea_Marker_PLATTS = 17.62 where Price_LNG_Japan_Korea_Marker_PLATTS is null

--Mean of updated column
select avg(Price_LNG_Japan_Korea_Marker_PLATTS) as Mean_Value  from #temp --17.62

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_LNG_Japan_Korea_Marker_PLATTS)  over()  as Median_Value from #temp --13.33

--Mode of update column
select top 1 Price_LNG_Japan_Korea_Marker_PLATTS, count(*) as Total_Value_Count  from #temp group by Price_LNG_Japan_Korea_Marker_PLATTS order by count(*) desc --17.62


--Measure of dispersion:

--Variance
select VAR(Price_LNG_Japan_Korea_Marker_PLATTS) as Variance from #temp --155.71

--Standard Deviation
select STDEVP(Price_LNG_Japan_Korea_Marker_PLATTS) from #temp --12.47

--Skewness
with  A as(
select cast(Price_LNG_Japan_Korea_Marker_PLATTS as float) as x from #temp
where Price_LNG_Japan_Korea_Marker_PLATTS is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --1.101

--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Price_LNG_Japan_Korea_Marker_PLATTS as float) as x,
       avg(Price_LNG_Japan_Korea_Marker_PLATTS) over() as avg_value
       from #temp
       where Price_LNG_Japan_Korea_Marker_PLATTS is not null ) as t; --0.92






--16. Price_Natural_Gas

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_Natural_Gas is null   --9 Missing Values

--Checking value that are replaceable with nulls in column Price_Natural_Gas
select avg(Price_Natural_Gas) from #temp --3.69

--Filling Missing Values with mean 3.69
update #temp set Price_Natural_Gas = 3.69 where Price_Natural_Gas is null

--Mean of updated column
select avg(Price_Natural_Gas) as Mean_Value  from #temp --3.69

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_Natural_Gas)  over()  as Median_Value from #temp --2.8

--Mode of update column
select top 1 Price_Natural_Gas, count(*) as Total_Value_Count  from #temp group by Price_Natural_Gas order by count(*) desc --3.69


--Measure of dispersion:

--Variance
select VAR(Price_Natural_Gas) as Variance from #temp --3.66

--Standard Deviation
select STDEVP(Price_Natural_Gas) from #temp --1.91

--Skewness
with  A as(
select cast(Price_Natural_Gas as float) as x from #temp
where Price_Natural_Gas is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --1.260


--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Price_Natural_Gas as float) as x,
       avg(Price_Natural_Gas) over() as avg_value
       from #temp
       where Price_Natural_Gas is not null ) as t; --0.67




--17. Price_ZAR_USD

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_ZAR_USD is null   --0 Missing Values

--Checking value that are replaceable with nulls in column Price_ZAR_USD
select avg(Price_ZAR_USD) from #temp --0.059

--Filling Missing Values with mean 0.059
update #temp set Price_ZAR_USD = 0.059 where Price_ZAR_USD is null

--Mean of updated column
select avg(Price_ZAR_USD) as Mean_Value  from #temp --0.059

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_ZAR_USD)  over()  as Median_Value from #temp --0.058

--Mode of update column
select top 1 Price_ZAR_USD, count(*) as Total_Value_Count  from #temp group by Price_ZAR_USD order by count(*) desc --0.052


--Measure of dispersion:

--Variance
select VAR(Price_ZAR_USD) as Variance from #temp --3.68

--Standard Deviation
select STDEVP(Price_ZAR_USD) from #temp --0.006

--Skewness
with  A as(
select cast(Price_ZAR_USD as float) as x from #temp
where Price_ZAR_USD is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --0.34


--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Price_ZAR_USD as float) as x,
       avg(Price_ZAR_USD) over() as avg_value
       from #temp
       where Price_ZAR_USD is not null ) as t; --  -1.21



--18. Price_ICE

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_ICE is null   --40 Missing Values

--Checking value that are replaceable with nulls in column Price_ICE
select avg(Price_ICE) from #temp --112.75

--Filling Missing Values with mean 112.75
update #temp set Price_ICE = 112.75 where Price_ICE is null

--Mean of updated column
select avg(Price_ICE) as Mean_Value  from #temp --112.75

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_ICE)  over()  as Median_Value from #temp --112.41

--Mode of update column
select top 1 Price_ICE, count(*) as Total_Value_Count  from #temp group by Price_ICE order by count(*) desc --112.75


--Measure of dispersion:

--Variance
select VAR(Price_ICE) as Variance from #temp --181.68

--Standard Deviation
select STDEVP(Price_ICE) from #temp --13.47

--Skewness
with  A as(
select cast(Price_ICE as float) as x from #temp
where Price_ICE is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --0.22


--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Price_ICE as float) as x,
       avg(Price_ICE) over() as avg_value
       from #temp
       where Price_ICE is not null ) as t; --  -0.79



--19. Price_Dutch_TTF

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_Dutch_TTF is null   --31 Missing Values

--Checking value that are replaceable with nulls in column Price_Dutch_TTF
select avg(Price_Dutch_TTF) from #temp --57.38

--Filling Missing Values with mean 57.38
update #temp set Price_Dutch_TTF = 57.38 where Price_Dutch_TTF is null

--Mean of updated column
select avg(Price_Dutch_TTF) as Mean_Value  from #temp --57.38

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_Dutch_TTF)  over()  as Median_Value from #temp --36.77

--Mode of update column
select top 1 Price_Dutch_TTF, count(*) as Total_Value_Count  from #temp group by Price_Dutch_TTF order by count(*) desc --57.38


--Measure of dispersion:

--Variance
select VAR(Price_Dutch_TTF) as Variance from #temp --2764.26

--Standard Deviation
select STDEVP(Price_Dutch_TTF) from #temp --52.55

--Skewness
with  A as(
select cast(Price_Dutch_TTF as float) as x from #temp
where Price_Dutch_TTF is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --1.73


--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Price_Dutch_TTF as float) as x,
       avg(Price_Dutch_TTF) over() as avg_value
       from #temp
       where Price_Dutch_TTF is not null ) as t; --  -3.30



--20. Price_Indian_en_exg_rate

-- Measure of central tendancy:

--Missing Values
select count(*) from #temp where Price_Indian_en_exg_rate is null   --60 Missing Values

--Checking value that are replaceable with nulls in column Price_Indian_en_exg_rate
select avg(Price_Indian_en_exg_rate) from #temp --141.61

--Filling Missing Values with mean 141.61
update #temp set Price_Indian_en_exg_rate = 141.61 where Price_Indian_en_exg_rate is null

--Mean of updated column
select avg(Price_Indian_en_exg_rate) as Mean_Value  from #temp --141.61

--Median of updated column
select DISTINCT PERCENTILE_CONT(0.5)  within group (order by Price_Indian_en_exg_rate)  over()  as Median_Value from #temp --141.61

--Mode of update column
select top 1 Price_Indian_en_exg_rate, count(*) as Total_Value_Count  from #temp group by Price_Indian_en_exg_rate order by count(*) desc --141.61


--Measure of dispersion:

--Variance
select VAR(Price_Indian_en_exg_rate) as Variance from #temp --2772.87

--Standard Deviation
select STDEVP(Price_Indian_en_exg_rate) from #temp --52.63

--Skewness
with  A as(
select cast(Price_Indian_en_exg_rate as float) as x from #temp
where Price_Indian_en_exg_rate is not null
),
B as(
select count(*) as N ,
avg(x) as avg_value,
stdev(x) as std_value from A
)
select sum(power(a.x - b.avg_value,3))/b.N/power(b.std_value,3) as skewness from A as a cross join B as b group by b.N, b.std_value  --0.38


--Kurtosis
select  sum(power(x- avg_value,4)) / count(*) / (power( sum(power(x-avg_value,2)) / count(*),2)) -3 as Kurtosis from (
select cast(Price_Indian_en_exg_rate as float) as x,
       avg(Price_Indian_en_exg_rate) over() as avg_value
       from #temp
       where Price_Indian_en_exg_rate is not null ) as t; --  0.070



       