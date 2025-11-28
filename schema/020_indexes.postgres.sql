-- Auto-generated from schema-map-postgres.psd1 (map@mtime:2025-11-21T00:25:46Z)
-- engine: postgres
-- table:  device_fingerprints

CREATE INDEX IF NOT EXISTS idx_df_user ON device_fingerprints (user_id);

CREATE INDEX IF NOT EXISTS idx_df_last_seen ON device_fingerprints (last_seen);

CREATE INDEX IF NOT EXISTS idx_df_user_last_seen ON device_fingerprints (user_id, last_seen);
