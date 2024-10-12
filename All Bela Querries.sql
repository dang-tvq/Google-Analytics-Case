SELECT COUNT (DISTINCT daily_activity.id) AS act_id, COUNT(DISTINCT sleep_day.id) AS slp_id, COUNT(DISTINCT weight_info.id) AS wght_id, COUNT(DISTINCT hourly_step.id) AS step_id
FROM fitabase_data.daily_activity
FULL JOIN fitabase_data.sleep_day ON daily_activity.id = sleep_day.id
FULL JOIN fitabase_data.weight_info ON daily_activity.id = weight_info.id
FULL JOIN fitabase_data.hourly_step ON daily_activity.id = hourly_step.id

SELECT COUNT (DISTINCT daily_activity.id) AS act_id, COUNT(DISTINCT sleep_day.id) AS slp_id, COUNT(DISTINCT weight_info.id) AS wght_id, COUNT(DISTINCT hourly_step.id) AS step_id
FROM fitabase_data.daily_activity
JOIN fitabase_data.sleep_day ON daily_activity.id = sleep_day.id
JOIN fitabase_data.weight_info ON daily_activity.id = weight_info.id
JOIN fitabase_data.hourly_step ON daily_activity.id = hourly_step.id

