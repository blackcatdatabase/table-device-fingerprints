# device_fingerprints

Known device/browser fingerprints with derived risk scoring.

## Columns
| Column | Type | Null | Default | Description |
| --- | --- | --- | --- | --- |
| fingerprint_hash | mysql: BINARY(32) / postgres: BYTEA | NO |  | Stable hash of the fingerprint payload. |
| first_seen | mysql: DATETIME(6) / postgres: TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Timestamp when the device first appeared. |
| id | BIGINT | NO |  | Surrogate primary key. |
| last_seen | DATETIME(6) | NO | CURRENT_TIMESTAMP(6) | Last time the device was observed. |
| user_id | BIGINT | YES |  | Related user (FK users.id), nullable. |
| last_ip_hash | mysql: BINARY(32) / postgres: BYTEA | YES |  | Hashed last known IP. |
| attributes | mysql: JSON / postgres: JSONB | YES |  | JSON blob with device characteristics. |
| last_ip_key_version | VARCHAR(64) | YES |  | Key version used for last_ip_hash. |
| risk_score | mysql: TINYINT / postgres: SMALLINT | YES |  | 0-100 risk score derived from signals. |

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
| vw_device_fingerprints | mysql | algorithm=MERGE, security=INVOKER | [../schema/040_views.mysql.sql](../schema/040_views.mysql.sql) |
| vw_device_risk_recent | mysql | algorithm=TEMPTABLE, security=INVOKER | [../schema/040_views_joins.mysql.sql](../schema/040_views_joins.mysql.sql) |
| vw_device_fingerprints | postgres |  | [../schema/040_views.postgres.sql](../schema/040_views.postgres.sql) |
| vw_device_risk_recent | postgres |  | [../schema/040_views_joins.postgres.sql](../schema/040_views_joins.postgres.sql) |
