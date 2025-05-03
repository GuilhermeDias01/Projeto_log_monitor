#!/bin/bash

set -e
source config.env

mkdir -p reports
LOG_REPORT="reports/log_alerts.txt"

echo "[*] Escanenado $LOG_TO_SCAN por falha de login...." > "$LOG_REPORT"

if grep "Failed password" "$LOG_TO_SCAN" >> "$LOG_REPORT"; then
  echo "[+] Encontradas falhas de login."
else
  echo "[-] Nenhuma falha de login detectada." >> "$LOG_REPORT"
fi

if grep "authentication failure" "$LOG_TO_SCAN" >> "$LOG_REPORT"; then
  echo "[+] Encontradas falhas de autenticação."
else
  echo "[-] Nenhuma falha de autenticação detectada." >> "$LOG_REPORT"
fi
