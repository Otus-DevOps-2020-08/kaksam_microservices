#!/bin/bash

if [ "$1" = "--list" ]; then
#    cd ../terraform/stage > /dev/null
#    APP_IP=$(terraform show | grep external_ip_address_app | sed 's/\x1b\[[0-9;]*[a-zA-Z]//g' |awk '{print $3}'|  tr -d \")
#    DB_IP=$(terraform show | grep external_ip_address_db | sed 's/\x1b\[[0-9;]*[a-zA-Z]//g' |awk '{print $3}'|  tr -d \")
    APP_IP=$(yc compute instance list | grep reddit-app-prod |awk '{print $10}')
    DB_IP=$(yc compute instance list | grep reddit-db-prod | awk '{print $10}')
    DB_INT_IP=$(yc compute instance list | grep reddit-db-prod | awk '{print $12}')
#    cd - > /dev/null
    cat << _EOF_
    {
        "_meta": {
            "hostvars": {
                "appserver": {
                    "ansible_host": "${APP_IP}"
                },
                "dbserver": {
                    "ansible_host": "${DB_IP}",
                    "db_host": "${DB_INT_IP}"
                }
            }
        },
        "app": {
            "hosts": [
                "appserver"
            ]
        },
        "db": {
            "hosts": [
                "dbserver"
            ]
        }
    }
_EOF_
else
    cat << _EOF_
    {
        "_meta": {
                "hostvars": {}
        },
        "all": {
                "children": [
                        "ungrouped"
                ]
        },
        "ungrouped": {}
    }
_EOF_
fi
