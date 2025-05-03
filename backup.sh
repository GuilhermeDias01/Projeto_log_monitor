#!/bin/bash

source config.env

mkdir -p "$BACKUP_DEST" reports

NOW=$(date '+%Y-%m-%d_%H-%M-%S')
BACKUP_FILE="$BACKUP_DEST/backup_$NOW.tar.gz"
CHECKSUM_FILE="reports/checksums.sha256"

echo "[*] Gerando backup: $BACKUP_FILE" | tee reports/backup_report.txt
tar -czf "$BACKUP_FILE" $BACKUP_DIRS

echo "[*] Gerando hash de integridade..." | tee -a reports/backup_report.txt
sha256sum "$BACKUP_FILE" >> "$CHECKSUM_FILE"
