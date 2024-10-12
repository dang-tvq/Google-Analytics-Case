1. How many unique user Ids are in each table?
SELECT COUNT (DISTINCT daily_activity.id) AS act_id, COUNT(DISTINCT sleep_day.id) AS slp_id, COUNT(DISTINCT weight_info.id) AS wght_id, COUNT(DISTINCT hourly_step.id) AS step_id
FROM fitabase_data.daily_activity
FULL JOIN fitabase_data.sleep_day ON daily_activity.id = sleep_day.id
FULL JOIN fitabase_data.weight_info ON daily_activity.id = weight_info.id
FULL JOIN fitabase_data.hourly_step ON daily_activity.id = hourly_step.id

2. How many users overlap in each table?
SELECT COUNT (DISTINCT daily_activity.id) AS act_id, COUNT(DISTINCT sleep_day.id) AS slp_id, COUNT(DISTINCT weight_info.id) AS wght_id, COUNT(DISTINCT hourly_step.id) AS step_id
FROM fitabase_data.daily_activity
JOIN fitabase_data.sleep_day ON daily_activity.id = sleep_day.id
JOIN fitabase_data.weight_info ON daily_activity.id = weight_info.id
JOIN fitabase_data.hourly_step ON daily_activity.id = hourly_step.id

3. What specific user Ids are in or lacking from each table?
select
  distinct
    daily_activity.id AS act_id,
    sleep_day.id AS slp_id,
    weight_info.id AS wght_id,
    hourly_step.id AS step_id
from
  fitabase_data.daily_activity
Full join fitabase_data.sleep_day on daily_activity.id = sleep_day.id
Full join fitabase_data.weight_info on daily_activity.id = weight_info.id
Full join fitabase_data.hourly_step on daily_activity.id = hourly_step.id

4. What user ids overlap sets?
select
  distinct
    daily_activity.id AS act_id,
    sleep_day.id AS slp_id,
    weight_info.id AS wght_id,
    hourly_step.id AS step_id
from
  fitabase_data.daily_activity
join fitabase_data.sleep_day on daily_activity.id = sleep_day.id
join fitabase_data.weight_info on daily_activity.id = weight_info.id
join fitabase_data.hourly_step on daily_activity.id = hourly_step.id

-- 5. How much activity are users performing on average? 
select
  distinct id,
  count(id) as logs,
  avg(step) as avg_step,
  avg(total_distance) as avg_dis,
  avg(Very_Active_Minutes) as avg_very_min,
  avg(Fairly_Active_Minutes) as avg_fair_min,
  avg(Lightly_Active_Minutes) as avg_light_min,
  avg(Sedentary_Minutes) as avg_sed_min,
  avg(Calories) as avg_calo
from
  fitabase_data.daily_activity
group by id
order by id

-- 6. How much sleep do users get on average?
select *,
(avg_min_asleep/60) as avg_hr_asleep
from (
select
  distinct id,
  count(id) as logs,
  SUM(time_awake) AS total_min_awake_in_bed,    
  AVG(time_awake) AS avg_min_awake_in_bed,    
  SUM(TotalMinutesAsleep) AS total_min_asleep,      
  AVG(TotalMinutesAsleep) AS avg_min_asleep
from
  fitabase_data.sleep_day
group by id
order by id )

-- 7. Combine activity and sleep averages
SELECT
    t1.*,
    t2.* EXCEPT(id)
  FROM
    `adept-protocol-431802-t9.fitabase_data.acti_avg_by_id` AS t1
    INNER JOIN `adept-protocol-431802-t9.fitabase_data.sleep_by_id` AS t2 ON t1.id = t2.id
order by t2.id

-- 8. What days do the most and least activity take place on?
SELECT day,
COUNT(day) AS logs,
 Round (AVG(step)) AS avg_steps,
 AVG(Very_Active_Minutes) AS avg_very_act_min,
 AVG(Fairly_Active_Minutes) AS avg_fairly_act_min,
 AVG(Lightly_Active_Minutes) AS avg_lightly_act_min,
 AVG(Sedentary_Minutes) AS avg_sedentary_min,
 Round (AVG(total_distance)) AS avg_total_dist,
 Round (AVG(Calories)) AS avg_calories_burned
FROM fitabase_data.daily_activity
GROUP BY day
ORDER BY
                 
     CASE
WHEN Day = 'Sunday' THEN 1
WHEN Day = 'Monday' THEN 2  
WHEN Day = 'Tuesday' THEN 3  
WHEN Day = 'Wednesday' THEN 4
WHEN Day = 'Thursday' THEN 5
WHEN Day = 'Friday' THEN 6
WHEN Day = 'Saturday' THEN 7
     END ASC

-- 9. What days do users have the most and least sleep?
SELECT day,
COUNT(day) AS logs,
 AVG(time_awake) AS avg_awake,
 AVG(TotalMinutesAsleep) AS avg_total_min_sleep,
 AVG(TotalTimeInBed) AS avg_total_bed,
FROM fitabase_data.sleep_day
GROUP BY day
ORDER BY
                 
     CASE
WHEN Day = 'Sunday' THEN 1
WHEN Day = 'Monday' THEN 2  
WHEN Day = 'Tuesday' THEN 3  
WHEN Day = 'Wednesday' THEN 4
WHEN Day = 'Thursday' THEN 5
WHEN Day = 'Friday' THEN 6
WHEN Day = 'Saturday' THEN 7
     END ASC

-- 10. Combine activity and sleep data
select
  avg_sleep_by_day.day,
  avg_sleep_by_day.logs as sleep_logs,
  avg_acti_day.logs as acti_logs,
  avg_awake,
  avg_total_min_sleep,
  avg_total_bed,
  avg_very_act_min,
  avg_fairly_act_min,
  avg_lightly_act_min,
  avg_sedentary_min,
from
  fitabase_data.avg_sleep_by_day
Join fitabase_data.avg_acti_day on avg_acti_day.day = avg_sleep_by_day.day
order by
  case
    WHEN day = 'Sunday' THEN 1
    WHEN Day = 'Monday' THEN 2
    WHEN Day = 'Tuesday' THEN 3
    WHEN Day = 'Wednesday' THEN 4
    WHEN Day = 'Thursday' THEN 5
    WHEN Day = 'Friday' THEN 6
    WHEN Day = 'Saturday' THEN 7
        END ASC;
   
-- 11. Are there any activity trends over time?
SELECT
    date,
    Round(AVG(step)) AS average_steps,
    Round(AVG(total_distance)) AS average_distance,
    Round(AVG(Calories)) AS average_calories,
    Round(AVG(Sedentary_Minutes)) AS average_sedentary_minutes,
    Round(AVG(Lightly_Active_Minutes)) AS average_lightly_active_minutes,
    Round(AVG(Fairly_Active_Minutes)) AS average_fairly_active_minutes,
    Round(AVG(Very_Active_Minutes)) AS average_very_active_minutes
  FROM
    `adept-protocol-431802-t9.fitabase_data.daily_activity`
  GROUP BY 1
ORDER BY
  date

-- 12. Are there any sleep trends over time?
select *,
(avg_min_sleep/60) as avg_hour_sleep
from
  (
    select distinct date,
    count(date) as logs,
    AVG(time_awake) AS avg_awake,
    round(AVG(TotalMinutesAsleep)) AS avg_min_sleep,
    AVG(TotalTimeInBed) AS avg_time_in_bed
    from
      fitabase_data.sleep_day
    group by date
    order by date
  )

-- 14. What are the average weights and how often are they logged?
select
  distinct id,
  count(id) as logs,
  avg(WeightKG) as avg_weight,
  avg(BMI) as avg_bmi
from
  fitabase_data.weight_info
group by id
order by id

-- 16. How do the number of steps vary by day?
select
  day,
  round(avg(step_total)) as avg_step
from
  fitabase_data.hourly_step
group by day
order by
    case
      when day = 'Sunday' then 1
      WHEN Day = 'Monday' THEN 2
          WHEN Day = 'Tuesday' THEN 3
          WHEN Day = 'Wednesday' THEN 4
          WHEN Day = 'Thursday' THEN 5
          WHEN Day = 'Friday' THEN 6
          WHEN Day = 'Saturday' THEN 7
     END ASC

-- 17. How do steps vary by time?
select
  distinct time,
  round(avg(step_total)) as avg_step
from
  fitabase_data.hourly_step
group by time
order by length(time), time


-- 20. What percent does each activity make up of an average day for all users?
SELECT *,
  (avg_very_act_min_wk /weekly_avg_min_total) AS very_act_percent,        
  (avg_fairly_act_min_wk /weekly_avg_min_total) AS fairly_act_percent,      
  (avg_lightly_act_min_wk /weekly_avg_min_total) AS lightly_act_percent,      
  (avg_sedentary_min_wk /weekly_avg_min_total) AS sedentary_percent,      
  (avg_min_asleep_wk /weekly_avg_min_total) AS asleep_percent,      
  (avg_min_awake_in_bed_wk /weekly_avg_min_total) AS awake_in_bed_percent        
FROM (
SELECT *,
(avg_min_awake_in_bed_wk + avg_min_asleep_wk + avg_very_act_min_wk + avg_fairly_act_min_wk + avg_lightly_act_min_wk + avg_sedentary_min_wk) AS weekly_avg_min_total
FROM (
 SELECT
 AVG(avg_awake) AS avg_min_awake_in_bed_wk,
 AVG(avg_total_min_sleep) AS avg_min_asleep_wk,
 SUM(avg_sleep_by_day.logs) AS sleep_logs,        
 SUM(avg_acti_day.logs) AS activity_logs,
 AVG(avg_very_act_min) AS avg_very_act_min_wk,
 AVG(avg_fairly_act_min) AS avg_fairly_act_min_wk,
 AVG(avg_lightly_act_min) AS avg_lightly_act_min_wk,
 AVG(avg_sedentary_min) AS avg_sedentary_min_wk      
FROM fitabase_data.avg_sleep_by_day
JOIN fitabase_data.avg_acti_day ON avg_sleep_by_day.day = avg_acti_day.day))


