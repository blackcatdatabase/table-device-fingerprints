-- Auto-generated from schema-map-mysql.yaml (map@4ae85c5)
-- engine: mysql
-- table:  device_fingerprints

CREATE INDEX idx_df_user_last_seen ON device_fingerprints (user_id, last_seen);
