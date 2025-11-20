-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  device_fingerprints
-- Contract view for [device_fingerprints]
CREATE OR REPLACE VIEW vw_device_fingerprints AS
SELECT
  id,
  user_id,
  fingerprint_hash,
  UPPER(encode(fingerprint_hash, 'hex')) AS fingerprint_hash_hex,
  attributes,
  risk_score,
  first_seen,
  last_seen,
  last_ip_hash,
  UPPER(encode(last_ip_hash, 'hex')) AS last_ip_hash_hex,
  last_ip_key_version
FROM device_fingerprints;

-- Auto-generated from schema-views-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  device_fingerprints_risk_recent
-- Devices with elevated risk seen in last 30 days
CREATE OR REPLACE VIEW vw_device_risk_recent AS
SELECT
  d.id,
  d.user_id,
  d.risk_score,
  d.first_seen,
  d.last_seen,
  UPPER(encode(d.fingerprint_hash,''hex'')) AS fingerprint_hash_hex
FROM device_fingerprints d
WHERE d.last_seen > now() - interval ''30 days''
  AND d.risk_score IS NOT NULL
ORDER BY d.risk_score DESC, d.last_seen DESC;

