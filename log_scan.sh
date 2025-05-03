#!/bin/bash

source config.env

mkdir -p reports
LOG_REPORT="reports/log_alerts.txt"

echo "[*] Escanenado $LOG_TO_SCAN por falha de login...." > "$LOG_REPORT"

grep "Failed passowrd" "$LOG_TO_SCAN" >> "$LOG_REPORT"
grep "Authentication failure" "$LOG_TO_SCAN" >> "$LOG_REPORT"

