#!/bin/bash
# Module for log monitoring logic

monitor_logs() {
    local file=$1
    shift
    local keywords=("$@")

    for keyword in "${keywords[@]}"; do
        grep -i "$keyword" "$file" 2>/dev/null
    done
}
