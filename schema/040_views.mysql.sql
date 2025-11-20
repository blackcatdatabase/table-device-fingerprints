-- Auto-generated from schema-views-mysql.psd1 (map@db2f8b8)
-- engine: mysql
-- table:  device_fingerprints
-- Contract view for [device_fingerprints]
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_device_fingerprints AS
SELECT
  id,
  user_id,
  fingerprint_hash,
  UPPER(HEX(fingerprint_hash)) AS fingerprint_hash_hex,
  attributes,
  risk_score,
  first_seen,
  last_seen,
  last_ip_hash,
  UPPER(HEX(last_ip_hash)) AS last_ip_hash_hex,
  last_ip_key_version
FROM device_fingerprints;

-- Auto-generated from schema-views-mysql.psd1 (map@db2f8b8)
-- engine: mysql
-- table:  device_fingerprints_risk_recent
-- Devices with elevated risk seen in last 30 days
CREATE OR REPLACE ALGORITHM=MERGE SQL SECURITY INVOKER VIEW vw_device_risk_recent AS
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

