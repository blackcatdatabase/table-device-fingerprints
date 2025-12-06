-- Auto-generated from schema-map-postgres.yaml (map@sha1:F0EE237771FBA8DD7C4E886FF276F91A862C3718)
-- engine: postgres
-- table:  device_fingerprints

ALTER TABLE device_fingerprints ADD CONSTRAINT fk_df_user FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE SET NULL;
