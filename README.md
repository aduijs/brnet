# birthright-static

Static site source for **birthright.net** — the public landing pages, compendium, wiki entry point, bloodlines, cinematic tour, and per-domain / per-NPC / per-organization HTML pages served by nginx from `/srv/birthright/static/` on `157.230.221.103`.

This is the GitHub-side backup / diff layer for that directory tree. It is **not** the canonical source.

---

## Production is canonical — read this before editing

The authoritative copy of every file in this repo lives on the production server, not here. Local git history is a backup and diff layer only.

**Always pull from production before editing. Always push back to production after editing. Then commit.**

If you edit locally and push to GitHub without round-tripping production, you will silently overwrite weeks of production-only work the next time someone deploys from the local clone. The repo drifted ~7 weeks before this baseline was captured — don't repeat that.

Reference memory: `feedback_birthright_static_prod_is_canonical.md` in the Black Dunes Press PKA.

---

## Production location

- **Server:** `root@157.230.221.103`
- **SSH key:** `G:/My Drive/BlackDunesPress-PKA/team-inbox/Brnet/Keys/br1ght_deploy`
- **Path:** `/srv/birthright/static/`
- **Served by:** `birthright-nginx` container on host port 80 (nginx serves static files directly — no build step, no cache flush needed)

---

## The pull-edit-push-commit workflow

```bash
# 1. Pull fresh from production into the local clone (this overwrites your working tree)
ssh -i "G:/My Drive/BlackDunesPress-PKA/team-inbox/Brnet/Keys/br1ght_deploy" root@157.230.221.103 \
  "tar -C /srv/birthright/static --exclude='temporary screenshots' --exclude='*.bak*' --exclude='.claude' -czf - ." \
  | tar -xzf -

# 2. Edit locally. Test by opening the file or running ./serve.mjs.

# 3. Push edited files back to production (and leave a timestamped backup on prod):
TS=$(date +%s)
ssh -i ".../br1ght_deploy" root@157.230.221.103 "cp /srv/birthright/static/wiki.html /srv/birthright/static/wiki.html.bak.gibil-$TS"
scp -i ".../br1ght_deploy" wiki.html root@157.230.221.103:/srv/birthright/static/wiki.html

# 4. Commit + push to GitHub for diff history
git add wiki.html && git commit -m "Wiki hero rewrite (pushed to prod $TS)" && git push
```

---

## What's excluded

`.gitignore` excludes:
- `temporary screenshots/` — 400+ MB of dev screenshots (Puppeteer workflow output)
- `.claude/` — local agent settings, not source
- `*.bak`, `*.bak.*` — timestamped backups left by edit tools on production
- `*.tar.gz`, `*.zip` — archive artifacts (owner makes these on production directly)
- `node_modules/`, OS junk

---

## Tarball backup

Each major snapshot push also leaves a timestamped tarball on production at `/srv/birthright/static.snapshot-YYYY-MM-DD.tar.gz` as a belt-and-suspenders rollback. Baseline tarball: `/srv/birthright/static.snapshot-2026-05-15.tar.gz` (765 MB, includes `temporary screenshots/`).
