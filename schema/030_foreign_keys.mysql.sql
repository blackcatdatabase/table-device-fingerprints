-- Auto-generated from schema-map-mysql.psd1 (map@734a489)
-- engine: mysql
-- table:  device_fingerprints
ALTER TABLE device_fingerprints ADD CONSTRAINT fk_df_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;
