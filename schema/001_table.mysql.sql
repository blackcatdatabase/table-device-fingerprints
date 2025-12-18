-- Auto-generated from schema-map-mysql.yaml (map@sha1:0D716345C0228A9FD8972A3D31574000D05317DB)
-- engine: mysql
-- table:  device_fingerprints

CREATE TABLE IF NOT EXISTS device_fingerprints (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id BIGINT UNSIGNED NULL,
  fingerprint_hash BINARY(32) NOT NULL,
  fingerprint_hash_key_version VARCHAR(64) NULL,
  attributes JSON NULL,
  risk_score TINYINT UNSIGNED NULL,
  first_seen DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  last_seen DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  last_ip_hash BINARY(32) NULL,
  last_ip_key_version VARCHAR(64) NULL,
  created_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
  updated_at DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
  UNIQUE KEY uq_device_fp (fingerprint_hash),
  INDEX idx_df_user      (user_id),
  INDEX idx_df_last_seen (last_seen)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci ROW_FORMAT=DYNAMIC;
