<!-- Auto-generated from schema-map-postgres.psd1 @ 62c9c93 (2025-11-20T21:38:11+01:00) -->
# Definition – device_fingerprints

Known device/browser fingerprints with derived risk scoring.

## Columns
| Column | Type | Null | Default | Description | Notes |
|-------:|:-----|:----:|:--------|:------------|:------|
| id | BIGINT | — | AS | Surrogate primary key. |  |
| user_id | BIGINT | YES | — | Related user (FK users.id), nullable. |  |
| fingerprint_hash | BYTEA | NO | — | Stable hash of the fingerprint payload. | PII: hashed |
| attributes | JSONB | YES | — | JSON blob with device characteristics. |  |
| risk_score | SMALLINT | YES | — | 0-100 risk score derived from signals. |  |
| first_seen | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Timestamp when the device first appeared. |  |
| last_seen | TIMESTAMPTZ(6) | NO | CURRENT_TIMESTAMP(6) | Last time the device was observed. |  |
| last_ip_hash | BYTEA | YES | — | Hashed last known IP. | PII: hashed |
| last_ip_key_version | VARCHAR(64) | YES | — | Key version used for last_ip_hash. |  |