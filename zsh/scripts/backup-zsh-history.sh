#!/bin/bash

# Backup zsh history with the same format as existing backups
# Format: zsh_history_YYYY_MM_DD.bkup

# Get today's date in the required format
DATE=$(date +"%Y_%m_%d")

# Source and destination paths
SOURCE="$HOME/.zsh_history"
BACKUP_DIR="$HOME/.zsh_history.bkup"
BACKUP_FILE="$BACKUP_DIR/zsh_history_${DATE}.bkup"

# Create backup directory if it doesn't exist
mkdir -p "$BACKUP_DIR"

# Only create backup if source file exists
if [ -f "$SOURCE" ]; then
    cp "$SOURCE" "$BACKUP_FILE"
    echo "$(date): Backed up zsh history to $BACKUP_FILE"
else
    echo "$(date): Source file $SOURCE not found"
    exit 1
fi 