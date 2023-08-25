SELECT 
  DATE_FORMAT(DATE_ADD(view_log.timestamp, INTERVAL 2 HOUR), '%Y_%m_%d') AS event_at,
  COUNT(*)
FROM view_log
INNER JOIN report_dashboard ON (report_dashboard.id = view_log.model_id)
INNER JOIN core_user ON (view_log.user_id = core_user.id) 
WHERE view_log.model = 'dashboard'
AND view_log.timestamp > DATE_SUB(CURRENT_DATE, INTERVAL 90 DAY)
GROUP BY 1
ORDER BY 1;
