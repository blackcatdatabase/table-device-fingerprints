-- Auto-generated from schema-map-mysql.yaml (map@sha1:0D716345C0228A9FD8972A3D31574000D05317DB)
-- engine: mysql
-- table:  device_fingerprints

CREATE INDEX idx_df_user_last_seen ON device_fingerprints (user_id, last_seen);
