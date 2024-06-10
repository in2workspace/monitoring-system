#!/bin/sh

check_service() {
    local service="$1"
    local port="$2"

    while ! nc -z $service $port; do
        echo "Waiting for $service:$port..."
        sleep 2
    done
    echo "$service:$port is available!"
}

while [ $# -gt 0 ]; do
    check_service "$1" "$2"
    shift 2
done
