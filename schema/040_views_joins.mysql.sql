-- Auto-generated from joins-mysql.psd1 (map@mtime:2025-11-27T17:49:37Z)
-- engine: mysql
-- view:   device_fingerprints_risk_recent
-- Devices with elevated risk seen in last 30 days
CREATE OR REPLACE ALGORITHM=TEMPTABLE SQL SECURITY INVOKER VIEW vw_device_risk_recent AS
SELECT
  d.id,
  d.user_id,
  d.risk_score,
  d.first_seen,
  d.last_seen,
  UPPER(HEX(d.fingerprint_hash)) AS fingerprint_hash_hex
FROM device_fingerprints d
WHERE d.last_seen > NOW() - INTERVAL 30 DAY
  AND d.risk_score IS NOT NULL
ORDER BY d.risk_score DESC, d.last_seen DESC;
