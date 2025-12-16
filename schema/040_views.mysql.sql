-- Auto-generated from schema-views-mysql.yaml (map@sha1:FFA9A9D6FA9EE079B0DAEBB6FEE023C138E8FFA1)
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
