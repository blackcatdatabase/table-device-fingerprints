-- Auto-generated from schema-map-mysql.psd1 (map@62c9c93)
-- engine: mysql
-- table:  device_fingerprints
CREATE INDEX idx_df_user_last_seen ON device_fingerprints (user_id, last_seen);
