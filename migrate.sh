#!/usr/bin/env bash
# Applies every migrations/V*.sql file that has not been applied yet, in order.
# Keeps a record in the schema_migrations table so each file runs only once.
set -euo pipefail
cd "$(dirname "$0")/.."

psql -v ON_ERROR_STOP=1 -q -c \
  "SET client_min_messages TO warning;
   CREATE TABLE IF NOT EXISTS schema_migrations (
     version TEXT PRIMARY KEY,
     applied_at TIMESTAMPTZ NOT NULL DEFAULT now());"

for file in migrations/V*.sql; do
  version=$(basename "$file" .sql)
  applied=$(psql -tAc "SELECT 1 FROM schema_migrations WHERE version = '$version';")
  if [ "$applied" = "1" ]; then
    echo "   skip   $version (already applied)"
  else
    echo "   apply  $version"
    psql -v ON_ERROR_STOP=1 -q --single-transaction \
      -f "$file" \
      -c "INSERT INTO schema_migrations (version) VALUES ('$version');"
  fi
done
echo ">> Migrations complete."
