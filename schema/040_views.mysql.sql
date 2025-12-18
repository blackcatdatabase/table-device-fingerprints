-- Auto-generated from schema-views-mysql.yaml (map@sha1:B3C579FF17AC186C47D2C4AC86B0738DB2308BF2)
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
  last_ip_key_version,
  created_at,
  updated_at
FROM device_fingerprints;
