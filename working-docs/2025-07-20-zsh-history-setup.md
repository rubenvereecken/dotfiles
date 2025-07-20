<!-- @format -->

# ZSH History Setup (2025-07-20)

## Current Configuration

- **HISTSIZE**: 10,000,000 (10M entries in memory)
- **SAVEHIST**: 10,000,000 (10M entries saved to disk)
- **Location**: `~/.zsh_history`
- **Current entries**: ~26K lines (Nov 2024 → present)

## History Options Active

- `EXTENDED_HISTORY` - timestamps included
- `INC_APPEND_HISTORY` - immediate write
- `SHARE_HISTORY` - shared between sessions
- `HIST_IGNORE_DUPS` - no consecutive duplicates

## Daily Backup System

- **Script**: `~/20tech/dotfiles/zsh/scripts/backup-zsh-history.sh`
- **Schedule**: Daily at 14:30 via cron
- **Format**: `~/.zsh_history.bkup/zsh_history_YYYY_MM_DD.bkup`
- **Log**: `~/.zsh_history.bkup/backup.log`

## Recovery

Original backup archive contains 175 daily files (Dec 2024 → Jun 2025). History was restored from June 29 backup to recover ~23K older entries.

## Monitoring

```bash
ls -la ~/.zsh_history.bkup/ | tail -5  # Recent backups
tail ~/.zsh_history.bkup/backup.log    # Backup status
```
