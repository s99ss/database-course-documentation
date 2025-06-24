SELECT a.alert_id, a.alert_type, a.severity, s.server_name
FROM Alerts a
INNER JOIN Servers s ON a.server_id = s.server_id;

SELECT s.server_id, s.server_name, a.alert_id, a.alert_type, a.severity
FROM Servers s
LEFT JOIN Alerts a ON s.server_id = a.server_id;

SELECT a.alert_id, a.alert_type, a.severity, s.server_name
FROM Servers s
RIGHT JOIN Alerts a ON s.server_id = a.server_id;

SELECT s.server_name, a.alert_id, a.alert_type, a.severity
FROM Servers s
FULL OUTER JOIN Alerts a ON s.server_id = a.server_id;

SELECT m.model_name, s.server_name
FROM AI_Models m
CROSS JOIN Servers s;

SELECT a.alert_id, a.alert_type, a.severity, s.server_name
FROM Alerts a
INNER JOIN Servers s ON a.server_id = s.server_id
WHERE a.severity = 'Critical';

SELECT s.server_id, s.server_name
FROM Servers s
LEFT JOIN ModelDeployments md ON s.server_id = md.server_id
WHERE md.deployment_id IS NULL;

SELECT m.model_name, s.server_name
FROM AI_Models m
CROSS JOIN Servers s
WHERE s.region LIKE 'eu-%';
