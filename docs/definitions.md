# device_fingerprints

Known device/browser fingerprints with derived risk scoring.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| attributes | JSONB | YES |  | JSON blob with device characteristics. |
| fingerprint_hash | BYTEA | NO |  | Stable hash of the fingerprint payload. |
| first_seen | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Timestamp when the device first appeared. |
| id | BIGINT | NO |  | Surrogate primary key. |
| last_ip_hash | BYTEA | YES |  | Hashed last known IP. |
| last_ip_key_version | VARCHAR(64) | YES |  | Key version used for last_ip_hash. |
| last_seen |  | NO | CURRENT_TIMESTAMP(6) | Last time the device was observed. |
| risk_score | SMALLINT | YES |  | 0-100 risk score derived from signals. |
| user_id | BIGINT | YES |  | Related user (FK users.id), nullable. |

## Engine Details

### mysql

Unique keys:
| Name | Columns |
| --- | --- |
| uq_device_fp | fingerprint_hash |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_df_last_seen | last_seen | INDEX idx_df_last_seen (last_seen) |
| idx_df_user | user_id | INDEX idx_df_user      (user_id) |
| idx_df_user_last_seen | user_id,last_seen | CREATE INDEX idx_df_user_last_seen ON device_fingerprints (user_id, last_seen) |
| uq_device_fp | fingerprint_hash | UNIQUE KEY uq_device_fp (fingerprint_hash) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_df_user | user_id | users(id) | ON DELETE SET |

### postgres

Unique keys:
| Name | Columns |
| --- | --- |
| uq_device_fp | fingerprint_hash |

Indexes:
| Name | Columns | SQL |
| --- | --- | --- |
| idx_df_last_seen | last_seen | CREATE INDEX IF NOT EXISTS idx_df_last_seen ON device_fingerprints (last_seen) |
| idx_df_user | user_id | CREATE INDEX IF NOT EXISTS idx_df_user ON device_fingerprints (user_id) |
| idx_df_user_last_seen | user_id,last_seen | CREATE INDEX IF NOT EXISTS idx_df_user_last_seen ON device_fingerprints (user_id, last_seen) |
| uq_device_fp | fingerprint_hash | CONSTRAINT uq_device_fp UNIQUE (fingerprint_hash) |

Foreign keys:
| Name | Columns | References | Actions |
| --- | --- | --- | --- |
| fk_df_user | user_id | users(id) | ON DELETE SET |

## Engine differences

## Views
| View | Engine | Flags | File |
| --- | --- | --- | --- |
| vw_device_fingerprints | mysql | algorithm=MERGE, security=INVOKER | [packages\device-fingerprints\schema\040_views.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/device-fingerprints/schema/040_views.mysql.sql) |
| vw_device_risk_recent | mysql | algorithm=TEMPTABLE, security=INVOKER | [packages\device-fingerprints\schema\040_views_joins.mysql.sql](https://github.com/blackcatacademy/blackcat-database/packages/device-fingerprints/schema/040_views_joins.mysql.sql) |
| vw_device_fingerprints | postgres |  | [packages\device-fingerprints\schema\040_views.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/device-fingerprints/schema/040_views.postgres.sql) |
| vw_device_risk_recent | postgres |  | [packages\device-fingerprints\schema\040_views_joins.postgres.sql](https://github.com/blackcatacademy/blackcat-database/packages/device-fingerprints/schema/040_views_joins.postgres.sql) |
