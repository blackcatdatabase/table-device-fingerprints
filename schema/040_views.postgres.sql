-- Auto-generated from schema-views-postgres.yaml (map@sha1:5C6FE96DC2067A978A357A1DCB8631B46C71D429)
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
  last_ip_key_version,
  created_at,
  updated_at
FROM device_fingerprints;
