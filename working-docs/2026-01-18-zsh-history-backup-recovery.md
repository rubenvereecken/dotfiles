<!-- @format -->

# ZSH History Backup Recovery (2026-01-18)

## Incident Summary

- **Problem**: History truncated from ~37K lines to ~2K lines
- **Recovery**: Merged Jan 12 backup with post-truncation commands
- **Result**: 39,854 lines recovered (Nov 2024 → Jan 18, 2026)
- **Loss**: ~23 hours (Jan 12 afternoon → Jan 13 afternoon)

## Timeline

| Date | Lines | Event |
|------|-------|-------|
| Jan 10 | 37K+ | macOS Tahoe 26.2 installed (10:08) + reboot |
| Jan 12 | 37,655 | Last healthy backup |
| Jan 13 | 1,459 | Truncation detected in backup — history starts at 13:45 |
| Jan 18 | 2,199 | Warning triggered, recovery initiated |

## Root Cause

**macOS Tahoe 26.2 upgrade** (Jan 10) with delayed corruption manifesting on Jan 13. Same pattern as November's 26.1 incident. The `HIST_FCNTL_LOCK` option did not prevent this — macOS upgrades remain the nemesis.

Multiple reboots on Jan 13 (21:50, 21:53, 21:57) likely triggered the corruption when zsh sessions attempted to reconcile with a partially damaged file.

## Recovery Procedure (Staging Approach)

### Step 1: Create Isolated Staging Directory

```bash
STAGE_DIR=~/.zsh_history_recovery_$(date +%Y%m%d_%H%M%S)
mkdir -p "$STAGE_DIR"
```

### Step 2: Backup Everything First

```bash
cp ~/.zsh_history "$STAGE_DIR/current_truncated.bkup"
cp ~/.zsh_history.bkup/zsh_history_YYYY_MM_DD.bkup "$STAGE_DIR/last_good_backup.bkup"
```

### Step 3: Verify Timeline (Check for Overlap)

```bash
# When does the good backup end?
tail -1 "$STAGE_DIR/last_good_backup.bkup"

# When does the truncated history start?
head -1 "$STAGE_DIR/current_truncated.bkup"

# Convert timestamps to human-readable
TIMESTAMP=$(tail -1 "$STAGE_DIR/last_good_backup.bkup" | grep -o '^: [0-9]*' | cut -d' ' -f2)
date -r $TIMESTAMP
```

### Step 4: Merge in Staging

```bash
# Concatenate: old backup + current (chronological order)
cat "$STAGE_DIR/last_good_backup.bkup" "$STAGE_DIR/current_truncated.bkup" > "$STAGE_DIR/merged_history.staging"

# Verify line count
wc -l "$STAGE_DIR/merged_history.staging"
```

### Step 5: Validate Before Deploy

```bash
# Check first/last entries span expected date range
head -3 "$STAGE_DIR/merged_history.staging"
tail -3 "$STAGE_DIR/merged_history.staging"

# Verify format (zsh extended history: `: timestamp:duration;command`)
grep -c '^: [0-9]*:[0-9]*;' "$STAGE_DIR/merged_history.staging"
```

### Step 6: Deploy with Final Safety Backup

```bash
# One last backup of live file
cp ~/.zsh_history ~/.zsh_history.pre_recovery_$(date +%Y%m%d_%H%M%S)

# Deploy merged history
cp "$STAGE_DIR/merged_history.staging" ~/.zsh_history

# Reload in current shell
fc -R
```

## Files Created This Recovery

```
~/.zsh_history_recovery_20260118_145350/
├── current_truncated.bkup    # 2,199 lines (Jan 13-18)
├── jan12_backup.bkup         # 37,655 lines (Nov 2024 → Jan 12)
└── merged_history.staging    # 39,854 lines (deployed)
```

## Lessons Learned

1. **Daily backups continue to save the day** — 6-day-old backup was sufficient
2. **Staging approach prevents accidental data loss** during recovery
3. **macOS upgrades remain hostile to zsh history** — `HIST_FCNTL_LOCK` insufficient
4. **Corruption can be delayed** — Jan 10 upgrade, Jan 13 corruption

## Future Considerations

- Pre-upgrade manual backup trigger
- More aggressive backup frequency (twice daily?)
- Investigate alternative history storage (sqlite? append-only log?)
- Consider `HIST_SAVE_NO_DUPS` to reduce file size and potential corruption surface
