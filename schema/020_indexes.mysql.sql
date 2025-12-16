-- Auto-generated from schema-map-mysql.yaml (map@sha1:B9D3BE28A74392B9B389FDAFB493BD80FA1F6FA4)
-- engine: mysql
-- table:  device_fingerprints

CREATE INDEX idx_df_user_last_seen ON device_fingerprints (user_id, last_seen);
