#!/usr/bin/env bash
# Runs once when the codespace is first created.
set -euo pipefail
echo ">> Installing the PostgreSQL command-line client (psql)..."
sudo apt-get update -y >/dev/null
sudo apt-get install -y postgresql-client >/dev/null
echo ">> Installing SQL linter (sqlfluff)..."
pip install --quiet --user "sqlfluff==3.*"
grep -q ".local/bin" ~/.bashrc || echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
export PATH="$HOME/.local/bin:$PATH"
echo ">> Waiting for the database to start..."
for i in $(seq 1 30); do
  pg_isready -q && break
  sleep 2
done
echo ">> Building the KimTay database..."
bash scripts/migrate.sh
echo ">> Setup complete. Try: psql -c 'SELECT COUNT(*) FROM customer;'"
