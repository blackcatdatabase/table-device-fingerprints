-- Auto-generated from schema-map-postgres.yaml (map@4ae85c5)
-- engine: postgres
-- table:  device_fingerprints

CREATE INDEX IF NOT EXISTS idx_df_user ON device_fingerprints (user_id);

CREATE INDEX IF NOT EXISTS idx_df_last_seen ON device_fingerprints (last_seen);

CREATE INDEX IF NOT EXISTS idx_df_user_last_seen ON device_fingerprints (user_id, last_seen);
