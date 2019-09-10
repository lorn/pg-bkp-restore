#!/bin/bash -e

print_info()
{
    printf "%s\n" "$1"
}

print_error()
{
    printf "ERROR - %s\n" "$1"
    exit 1
}

verify_env()
{
    if [ -z $POSTGRES_DB_A_DSN ] && [ -z $POSTGRES_DB_B_DSN ];
    then
        print_error "You need to configure the HOST env"
    else
        /usr/bin/env
    fi
}

run_pg_copy()
{
    pg_dump --no-owner --dbname=$POSTGRES_DB_A_DSN | psql --dbname=$POSTGRES_DB_B_DSN
    print_info "pg-copy completed"

    while getopts 'fh:' OPTION; do
        case "$OPTION" in
            f)
                print_info "finish"
                exit 0
                ;;

            h)
                print_info "with -f the script will exit"
                ;;
            ?)
            print_info "script usage: $(basename $0) [-f] [-h]" >&2
            exit 1
            ;;
        esac
    done

    read

}


verify_env
run_pg_copy
