#!/usr/bin/env bash
# Wipes the kimtay database and rebuilds it from the migrations.
# Use when you want a clean start. All data in the database is deleted.
set -euo pipefail
cd "$(dirname "$0")/.."
echo ">> Dropping and recreating the kimtay database..."
psql -d postgres -v ON_ERROR_STOP=1 -q -c "DROP DATABASE IF EXISTS kimtay WITH (FORCE);"
psql -d postgres -v ON_ERROR_STOP=1 -q -c "DROP ROLE IF EXISTS kimtay_readonly;"
psql -d postgres -v ON_ERROR_STOP=1 -q -c "DROP ROLE IF EXISTS kimtay_app;"
psql -d postgres -v ON_ERROR_STOP=1 -q -c "CREATE DATABASE kimtay;"
bash scripts/migrate.sh
