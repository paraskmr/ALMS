#!/bin/bash
# Entry point for Automated Log Monitoring System

SCRIPT_DIR=$(dirname "$0")
source "$SCRIPT_DIR/monitor_logs.sh"
source "$SCRIPT_DIR/alert_email.sh"
source "$SCRIPT_DIR/utils.sh"

# Sample log for WSL testing
LOG_FILE="/mnt/c/Users/paraskmr/Desktop/ALMS/logs/sample_syslog.log"
KEYWORDS=("error" "fail" "critical")

log_info "Starting WSL Log Monitoring on $LOG_FILE..."

monitor_logs "$LOG_FILE" "${KEYWORDS[@]}" | while read -r line; do
    log_info "Alert triggered: $line"
    send_email_alert "$line"
done
