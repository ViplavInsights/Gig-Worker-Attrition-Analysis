
-- 1. What is the total number of workers in the dataset?
SELECT COUNT(*) AS total_workers FROM gig_worker_data;

-- 2. How many workers have left (attrition)?
SELECT COUNT(*) AS total_attritions FROM gig_worker_data WHERE Attrition_flag = 1;

-- 3. How many workers have participated in protests?
SELECT COUNT(*) AS total_protests FROM gig_worker_data WHERE Protest_flag = 1;

-- 4. What are the most common reasons for attrition?
SELECT Attrition_reason, COUNT(*) AS reason_count
FROM gig_worker_data
WHERE Attrition_reason IS NOT NULL
GROUP BY Attrition_reason
ORDER BY reason_count DESC;

-- 5. What is the average earnings per day by shift type?
SELECT Shift_Type, ROUND(AVG(Earnings_per_day), 2) AS avg_earnings
FROM gig_worker_data
GROUP BY Shift_Type
ORDER BY avg_earnings DESC;

-- 6. What is the attrition count by city?
SELECT City, COUNT(*) AS total_workers, SUM(Attrition_flag) AS attritions
FROM gig_worker_data
GROUP BY City
ORDER BY attritions DESC;

-- 7. What is the average number of orders delivered by vehicle type?
SELECT Vehicle_Type, ROUND(AVG(Orders_delivered), 2) AS avg_orders
FROM gig_worker_data
GROUP BY Vehicle_Type
ORDER BY avg_orders DESC;

-- 8. What is the average earnings per day by education level?
SELECT Education_Level, ROUND(AVG(Earnings_per_day), 2) AS avg_earnings
FROM gig_worker_data
GROUP BY Education_Level
ORDER BY avg_earnings DESC;

-- 9. Do protests lead to attrition? (Check overlap)
SELECT 
  COUNT(*) AS protest_and_attrition
FROM gig_worker_data
WHERE Protest_flag = 1 AND Attrition_flag = 1;

-- 10. Compare average earnings and attrition across companies
SELECT 
  Company,
  ROUND(AVG(Earnings_per_day), 2) AS avg_earnings,
  SUM(Attrition_flag) AS attrition_count
FROM gig_worker_data
GROUP BY Company
ORDER BY avg_earnings DESC;

-- 11. What is the average bonus earned by shift type?
SELECT Shift_Type, ROUND(AVG(Bonus), 2) AS avg_bonus
FROM gig_worker_data
GROUP BY Shift_Type
ORDER BY avg_bonus DESC;

-- 12. Are there any duplicate Worker_IDs?
SELECT Worker_ID, COUNT(*) 
FROM gig_worker_data 
GROUP BY Worker_ID 
HAVING COUNT(*) > 1;

-- 13. What is the trend of earnings over time?
SELECT Date, ROUND(AVG(Earnings_per_day), 2) AS avg_earnings
FROM gig_worker_data
GROUP BY Date
ORDER BY Date;
