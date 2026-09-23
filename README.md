# KimTay Pet Supplies Database - DevSecOps Track

![CI](https://github.com/YOUR-USERNAME/YOUR-REPO/actions/workflows/ci.yml/badge.svg)

A PostgreSQL database for a fictional pet supply company, built and tested like production code:
version-controlled migrations, automated tests, least-privilege roles, SQL linting, and secret scanning
on every push.

## What this project shows

<!-- STUDENT: replace with 1-2 sentences a hiring manager will read. -->

## How to run it (about 3 minutes)

1. Click **Code > Codespaces > Create codespace on main**.
2. Wait for setup to finish (the terminal prints `Setup complete`).
3. In the terminal, run:

   ```bash
   psql -c "SELECT COUNT(*) FROM customer;"
   bash scripts/run_tests.sh
   ```

## Everyday commands

| Command | What it does |
| --- | --- |
| `psql` | Open a SQL prompt connected to the kimtay database (type `\q` to quit) |
| `bash scripts/migrate.sh` | Apply any new migration files |
| `bash scripts/run_tests.sh` | Run all database tests |
| `bash scripts/reset_db.sh` | Wipe and rebuild the database from scratch |
| `sqlfluff lint migrations tests` | Check SQL style |

## Project layout

| Folder | Contents |
| --- | --- |
| `.devcontainer/` | Codespace setup: app container + PostgreSQL 16 container |
| `.github/workflows/ci.yml` | Pipeline: secret scan, lint, build, test |
| `migrations/` | Numbered SQL files that build the database, applied in order |
| `tests/` | SQL checks; any failure stops the pipeline |
| `scripts/` | Helper scripts for migrate, test, and reset |
| `docs/` | Security notes and the assignment |

## Security choices

<!-- STUDENT: explain at least one choice you made and why. See docs/SECURITY_NOTES.md. -->

## Demo

<!-- STUDENT: link to your 3-5 minute video. -->

## What I would do next
