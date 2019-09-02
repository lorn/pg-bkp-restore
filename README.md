[![](https://img.shields.io/badge/Dockerbuild-OK-brightgreen)](https://hub.docker.com/r/lorn/pg_copy/builds)

# pg_copy
Docker image that copies data from DatabaseA to DatabaseB using pg_dump and psql

Basically, I do a `pg_dump` from DatabaseA and restore the dump, with `psql` on DatabaseB 

## Environment Variables

The pg_copy image uses several environment variables which are easy to miss. 

**Warning**: All the variables are required, the container wouldn't work without them

### `POSTGRES_PASSWORD`
## ENV

### `POSTGRES_DB_A_DSN`

The postgres DSN to the database that you want to copy

example:

```
 POSTGRES_DB_A_DSN: "postgresql://postgres:example@db:5432/postgres"
```

### `POSTGRES_DB_B_DSN`

The postgres DNS to the database that you want to load the data from `POSTGRES_DB_A_DSN`

example:

```
 POSTGRES_DB_B_DSN: "postgresql://postgres:example@db:5432/lorn"
```
# Test locally

If you want to test the `pg_copy` locally, you can use `docker-compose`:

Clone the repo and `docker-compose run --service-ports pg_copy`

You need to run `docker-compose run` two times because of the postgresql initialization bootstrap
