-- Auto-generated from schema-map-postgres.yaml (map@sha1:8C4F2BC1C4D22EE71E27B5A7968C71E32D8D884D)
-- engine: postgres
-- table:  device_fingerprints

CREATE INDEX IF NOT EXISTS idx_df_user ON device_fingerprints (user_id);

CREATE INDEX IF NOT EXISTS idx_df_last_seen ON device_fingerprints (last_seen);

CREATE INDEX IF NOT EXISTS idx_df_user_last_seen ON device_fingerprints (user_id, last_seen);
