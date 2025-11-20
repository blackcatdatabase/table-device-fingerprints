-- Auto-generated from schema-map-postgres.psd1 (map@9d3471b)
-- engine: postgres
-- table:  device_fingerprints
ALTER TABLE device_fingerprints ADD CONSTRAINT fk_df_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;
