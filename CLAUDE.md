# Dotfiles

Personal config and bootstrap script for a Debian developer machine.

- `install` sets up everything: packages, symlinks and git config. Keep it safe to re-run.
- Configs are symlinked into place, so edits here take effect immediately.
- Add new tools and config to `install`, so a fresh machine gets them too.
- `bin/diff-so-fancy` and `bin/prettyping` are vendored. Don't edit them.
- ClamAV (`run_clamscan` and its cron job) and Thunderbird's account setup are handled outside
  this repo, with separate instructions. Don't suggest adding them here.
