# CLAUDE.md — Gasthaus zum Löwen (loewen-forst.de)

Handover context for Claude Code. Verified against the real repo, the live site and the
local archive on 2026-10-29. Detailed menu how-to lives in [SPEISEKARTE.md](SPEISEKARTE.md) (German) —
read it before touching the menu.

## Project Purpose & Goal

- **What:** Static one-page website for *Gasthaus zum Löwen*, the restaurant of the user's
  parents (Yvonne & Gunther Geissler, run since 1994) in Forst near Bruchsal.
  Private/family project — no client, no team, no BCG context.
- **Live:** <https://loewen-forst.de> · Repo: <https://github.com/dgeissler/loewen-website> (branch `main`).
- **Ongoing deliverables:**
  1. Keep the website content current (texts, press, notices, images, opening hours).
  2. Keep the **menu** current: one 16:9 PowerPoint slide → `speisekarte.pdf` on the site
     (+ PNG for Google Business Profile).
- Site was migrated off Wix in April 2026 (Wix → own HTML on Cloudflare). Footer credits
  "Website by plaintly.de" (the user's own brand; separate project folder `../Plaintly`).

### Restaurant facts (as currently on the site — keep consistent everywhere)
| Field | Value |
|---|---|
| Address | Kirchstraße 8, 76694 Forst |
| Phone | +49 7251 300896 (`tel:+497251300896`) |
| Email | info@loewen-forst.de |
| Opening hours | Thu–Sat from 18:00 · Sun 11:30–14:00 · Mon–Wed closed |
| Reservations by phone | Mon–Sat 09:00–17:00 |
| Side room (Nebenzimmer) | ~50 people |
| Seasonal weeks | Swiss weeks after Fastnacht (Feb), asparagus in May, game (Wild) in autumn |
| Operator (Impressum) | Yvonne Geissler, VAT ID DE 163495322 |

These appear in several places in `index.html` (meta description, OG tags, JSON-LD, hero,
contact section, footer, Impressum, reservation popup) — change all of them together.

## Structure & Key Files

No build step, no package.json, no tests. Everything in the repo root is served as-is.

> ⚠️ **Every committed file is public unless excluded.** `assets.directory` is `.`, so the repo root is the
> web root. [.assetsignore](.assetsignore) (gitignore syntax) excludes `*.md`, `*.sh`, `*.pptx`,
> `wrangler.jsonc`, `.gitignore`, `.claude`. Adding a new non-public file type → add it there.
> Never commit secrets or private notes.

| Path | Purpose |
|---|---|
| `index.html` | The whole site (~1,000 lines): inline CSS + inline JS. Sections: `#home` (hero), `#ueber-uns`, press strip, `#speisekarte`, `#nebenzimmer`, `#kontakt`, Impressum/Datenschutz modal, footer, reservation-time popup, cookie banner (Google Maps only), lightbox. |
| `speisekarte.pptx` | **Menu source** — always edit this. |
| `speisekarte.pdf` | Menu shown on the site. Filename must stay exactly this (linked from the `#speisekarte` button and JSON-LD `"menu"`). |
| `SPEISEKARTE.md` | Menu workflow, slide design reference (colors, fonts, exact inch positions), automation notes. |
| `images/` | All site images. `presse-artikel.png` / `presse-artikel_2.png` = BNN newspaper clippings. |
| `wrangler.jsonc` | Cloudflare Workers static-assets config (project `loewen-website`, assets dir = repo root). |
| `robots.txt`, `sitemap.xml` | SEO. |
| `.assetsignore` | Files Cloudflare must not serve publicly (docs, scripts, PPTX, config). |
| `bilder-laden.sh` | **Legacy** one-off script that pulled images from the old Wix CDN. Don't run it — it would overwrite current images. |
| `.claude/settings.local.json` | Local permission allowlist (git, wrangler, python-pptx, PowerPoint paths…). |

Outside the repo:
- **Menu archive:** `C:\Users\geissler dominik\OneDrive\Privates_NEU\Gasthaus zum Löwen\` —
  `JJJJMM_Speisekarte.pptx/.png` (latest: `202608_*`), plus `Neue Website`, `bnn artikel`, `Bilder`, invoices.
- **Old claude.ai project handover** (menu reconciliation rules):
  `..\Übergabe an neuen Claude-Account\Projet_Speisekarte updaten\Speisekarten-Abgleich_PROJEKT-SETUP.md`.

### Run / preview / deploy
- Local preview: `python -m http.server 8791 --bind 127.0.0.1` in the repo root (or just open `index.html`).
- **Deploy = `git push` to `main`.** Cloudflare's Git integration builds automatically; live in ~30–60 s.
  No CI workflow in the repo.
- Verify deploy: download the live file and compare MD5 with local, e.g.
  `curl -sL https://loewen-forst.de/speisekarte.pdf | md5sum` vs `md5sum speisekarte.pdf`.
  (The live HTML differs from local only by a Cloudflare-injected `<script>` before `</body>` — that's expected.)
- Menu export: PowerPoint 365 via PowerShell COM (`SaveAs(out, 32)` → PDF; `Slides.Item(1).Export(out,"PNG",2400,1350)`).
  LibreOffice is **not** installed. `pdftotext` (Git Bash) works for reading the PDF.
- Python 3.14 is the only interpreter; `python-pptx` is currently **not installed** → `python -m pip install python-pptx` first.

### Code conventions
- Plain HTML/CSS/JS, no frameworks, no external JS. Fonts: Google Fonts *Cormorant Garamond* + *Josefin Sans*.
- CSS custom properties (`--red`, `--red-dark`, `--cream`, `--text`, …) — reuse them.
- Lightbox indices in `lightboxImages`: 0–1 Nebenzimmer, 2 = `presse-artikel.png`, 3 = `presse-artikel_2.png`.
  Adding an image means updating that array and the `openLightbox(n)` calls.
- Site copy is German (formal "Sie"). Section comments look like `<!-- ═══ NAME ═══ -->`.
- Commit messages: German, short, descriptive (e.g. "Presse-Bereich: Daten, Artikel-Link und bündige Ausrichtung"),
  with the Co-Authored-By trailer.

## Working Style & Conventions

- User (Dominik) writes in **German**; reply in German unless asked otherwise. This file is in English by request.
- Make the change, verify it, then commit with a clear German message. Pushing goes live immediately —
  show the user the change / say what will go live before pushing.
- Temporary notices (e.g. a phone outage) are added as a popup and **reverted via `git revert`** when obsolete.
  Template: commit `ae41f51` (phone-outage popup with replacement number, once per session), reverted in `cd470fd`.
- **Menu rules** (from SPEISEKARTE.md and the old claude.ai project):
  - Input is usually a Word list (target state) + the current PPTX. Align PPTX to the Word list.
  - **Ignore drinks and desserts** — they are never on the slide.
  - Dish order = order in Word. Update prices to Word. Add new dishes in the matching section, remove dropped ones.
  - Seasonal menus (asparagus, game, Swiss weeks): confirm with the user whether to switch the whole card.
  - If a dish match is ambiguous, or a PPTX dish is missing from Word (maybe only seasonal), **ask** before removing.
  - Design unchanged (fonts, colors, logo, icons). Same box widths for all item fields; prefer single-line items;
    price box wide enough for "€ 39,80" on one line (~0.90″ / ~820,000 EMU). Optimise layout for **PowerPoint** rendering.
  - Price format: `€   6,90` (one digit: 3 spaces) / `€ 12,50` (two digits: 1 space).
  - Finish with a short change report (added / removed / price changes).
  - Archive the finished card as `JJJJMM_Speisekarte.pptx` + `.png` in the archive folder; repo keeps
    `speisekarte.pptx` + `speisekarte.pdf`.
  - Note: the old claude.ai project returned only the PPTX ("no PDF"). In this repo workflow the PDF is required for the site.

## Current Status & Open Tasks

**Status (verified 2026-10-29):**
- `main` is clean and in sync with `origin/main`; HEAD `65cde6d` (2026-10-08). Live site = HEAD (MD5-checked).
- Current menu: **autumn card ("Herbstkarte")**, committed 2026-08-30, archive `202608_Speisekarte.*`.
  5 starters (€ 6,90–12,50, pumpkin soups, salads) + 7 mains (€ 21,50–39,80, e.g. Zürcher Geschnetzeltes,
  Zanderfilets, Lammrücken, Angus "Café de Paris", Kalbsrückensteak with chanterelles).
- Press section: two BNN articles — 26 Aug 2026 ("Darum kommen Gäste seit 32 Jahren", with link) and
  3 Feb 2025 ("Schweizer Flair mitten in Forst", image only).
- Phone-outage popup was live 2026-09-29 → 2026-09-30, now removed.

**Open / next (TODO):**
- [ ] **Game menu (Wildspezialitäten)** — the site promises game in autumn; current card has none. Ask the user
      whether a Wild card is coming. [to verify]
- [ ] Next known cycle: Swiss weeks after Fastnacht (≈ Feb 2027), asparagus (May 2027).
- [ ] `sitemap.xml` `lastmod` is still `2025-04-20` for both URLs — update when the menu/site changes.
- [ ] Impressum mentions **Google Analytics**, but no GA code is in `index.html`. Either remove the paragraph or
      add GA (then the cookie banner needs an analytics consent too). Ask the user. [to verify]
- [ ] Older press image `presse-artikel.png` has no `width`/`height`/`loading="lazy"` (newer one does); its article
      has no link yet. TODO: add link if the user has it.
- [ ] JSON-LD `aggregateRating` (4.7 / 90 ratings) is hard-coded — refresh occasionally. [to verify current Google values]
- [ ] Stale remote branch `origin/cloudflare/workers-autoconfig` (merged in PR #1) can be deleted — only with user OK.

No Claude memory files existed for this project at handover; besides chat history, nothing else is
lost from the old account.
