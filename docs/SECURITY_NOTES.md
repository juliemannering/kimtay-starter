# Security Notes

## Why there is no password in this repo

The class codespace runs PostgreSQL in a private container network that only your codespace can reach.
It uses `POSTGRES_HOST_AUTH_METHOD: trust`, so no password is needed and none is stored in Git.

**This is a classroom shortcut, not a production pattern.** In a real system:

- Passwords and keys live in a secret store (GitHub Actions secrets, Codespaces secrets, a cloud vault).
- The database is never reachable from the public internet.
- Every app and person gets its own login with only the permissions it needs.

## Least privilege in this project

| Role | Can do | Cannot do |
| --- | --- | --- |
| `postgres` | Everything (admin) | Should never be used by an app |
| `kimtay_readonly` | Read all tables | Change anything |
| `kimtay_app` | Read customers and products; create and update orders | Delete customers; see sales rep commissions |

The tests in `tests/02_security_tests.sql` prove these rules on every push.

## Secret scanning

The pipeline runs gitleaks on every push. If you ever commit a password or API key, the pipeline fails.
Deleting the file is not enough, because the secret is still in Git history. Treat it as leaked: change it,
then clean the history with your instructor.
