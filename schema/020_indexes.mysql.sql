-- Auto-generated from schema-map-mysql.yaml (map@sha1:09DF9CA612D1573E058190CC207FA257C05AEC1F)
-- engine: mysql
-- table:  device_fingerprints

CREATE INDEX idx_df_user_last_seen ON device_fingerprints (user_id, last_seen);
