-- Auto-generated from joins-postgres.yaml (map@85230ed)
-- engine: postgres
-- view:   device_risk_recent

-- Devices with elevated risk seen in last 30 days
CREATE OR REPLACE VIEW vw_device_risk_recent AS
SELECT
  d.id,
  d.user_id,
  d.risk_score,
  d.first_seen,
  d.last_seen,
  UPPER(encode(d.fingerprint_hash,$$hex$$)) AS fingerprint_hash_hex
FROM device_fingerprints d
WHERE d.last_seen > now() - interval $$30 days$$
  AND d.risk_score IS NOT NULL
ORDER BY d.risk_score DESC, d.last_seen DESC;
