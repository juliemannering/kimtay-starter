#!/usr/bin/env bash
# Runs every tests/*.sql file. Any failed check stops the run with an error.
set -euo pipefail
cd "$(dirname "$0")/.."
for file in tests/*.sql; do
  echo "   test   $(basename "$file")"
  psql -v ON_ERROR_STOP=1 -q -f "$file"
done
echo ">> All tests passed."
