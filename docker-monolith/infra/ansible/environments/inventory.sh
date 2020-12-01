#!/bin/bash

show_help() {
    printf "usage: inventory.sh --list %s\n
This script, when run with the --list option, sends ansible inventory in JSON format to STDOUT. %s\n"
}

gen_json_inventory() {
    cat << EOF > /tmp/inventory_ini_format.tmp
[docker]
EOF
    yc compute instance list | awk '/docker-app/ {print $4 " " "ansible_host="$10}' >> /tmp/inventory_ini_format.tmp
    ansible-inventory -i /tmp/inventory_ini_format.tmp --list
    rm /tmp/inventory_ini_format.tmp
}

case $1 in
    -h|--help)
        show_help
        exit
        ;;
    --list)
        gen_json_inventory
        exit
        ;;
    -?*)
        printf 'WARN: Unknown option (ignored): %s\n' "$1" >&2
        ;;
    *)
        printf "Dynamic inventory for OTUS DevOps homeworks.
This script, when run with the --list option, sends ansible inventory in JSON format to STDOUT. %s\n"
        ;;
esac
