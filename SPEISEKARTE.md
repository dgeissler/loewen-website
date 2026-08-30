# Speisekarte aktualisieren

Anleitung, wie die Speisekarte auf der Website (loewen-forst.de) aktualisiert wird –
von der Bearbeitung bis zum Livegang. Enthält auch alle technischen Details, damit
Updates künftig schnell gehen.

## Überblick

Die Speisekarte ist eine **einzelne 16:9-PowerPoint-Folie**, die als **PDF** (`speisekarte.pdf`)
und optional als **PNG** (für Google) exportiert wird.

- **Quelldatei:** `speisekarte.pptx` (liegt im Repo-Root – immer diese bearbeiten).
- **Website:** `speisekarte.pdf` im Repo-Root, verlinkt aus `index.html`.
- **Hosting:** Cloudflare, verbunden mit dem GitHub-Repo. **Jeder Push auf `main`
  deployt automatisch** – nach ~30 Sekunden ist die neue Version live (getestet und bestätigt).

## Voraussetzungen

- Microsoft PowerPoint (365) – zum Bearbeiten und PDF/PNG-Export.
- Zugriff auf das GitHub-Repo: <https://github.com/dgeissler/loewen-website>.

## Schnellster Weg (Standard)

1. **`speisekarte.pptx`** (im Repo-Root) in PowerPoint öffnen.
2. Texte/Preise der Gerichte direkt bearbeiten (Aufbau siehe „Design-Referenz" unten).
3. **Als PDF exportieren** → Datei → Exportieren → PDF. Dateiname **exakt `speisekarte.pdf`**.
4. **Als PNG exportieren** (falls für Google gebraucht): Folie als Grafik speichern, 2400×1350 px.
5. Beide Quelldateien (`speisekarte.pptx`) und die PDF im Repo-Root speichern/ersetzen.
6. Commit + Push auf `main`:
   ```bash
   git add speisekarte.pdf speisekarte.pptx
   git commit -m "Speisekarte aktualisiert"
   git push
   ```
7. Nach ~1 Min live prüfen: <https://loewen-forst.de/speisekarte.pdf> (ggf. Strg+F5).

> **Wichtig:** Der Dateiname muss `speisekarte.pdf` bleiben, sonst brechen die Website-Links.
> Bei gleichem Namen ist in `index.html` **nichts** zu ändern. Nur falls der Name/Pfad sich ändert,
> zwei Stellen anpassen:
> - Button „Speisekarte ansehen (PDF)": `<a href="speisekarte.pdf" ...>` (Abschnitt `#speisekarte`)
> - Structured Data / SEO: `"menu": "https://loewen-forst.de/speisekarte.pdf"` (im `<head>`)

## Archiv / Dateiablage

Fertige Karten werden zusätzlich dauerhaft archiviert in:
`C:\Users\geissler dominik\OneDrive\Privates_NEU\Gasthaus zum Löwen\`

Namensschema: **`JJJJMM_Speisekarte.pptx`** und **`JJJJMM_Speisekarte.png`**
(z. B. `202608_Speisekarte.pptx`). Die jeweils aktuelle Version liegt zusätzlich als
`speisekarte.pptx` / `speisekarte.pdf` im Repo.

## Google-Bild (Google Business Profile)

Google braucht ein **PNG**, keine PDF. Export als **2400×1350 px** (16:9), das ist scharf genug.
Das aktuelle liegt als `JJJJMM_Speisekarte.png` im Archivordner.

---

## Design-Referenz (Aufbau der Folie)

Damit Änderungen konsistent bleiben.

- **Format:** 16:9, 13,33″ × 7,5″. Eine Folie.
- **Links (weisse Seitenleiste):** Titel „Speisekarte" (weiss auf Bordeaux-Balken),
  Löwen-Logo, Kontakt (Telefon / Web / Adresse) mit Icons, Öffnungszeiten.
- **Rechts (Bordeaux-Panel #93152B):** zwei Sektionen **Vorspeisen** und **Hauptgerichte**.
- **Sektionsüberschriften:** Gold **#9B8548**, ~16 pt, fett, mit Gold-Trennlinie darunter.
- **Gerichte:** je ein Textfeld „Item …" (Name) + „Price …" (Preis). Der **Name beginnt fett**
  (Hauptbegriff), der **Beschreibungsteil ist normal** – beides 14 pt, weiss **#FFFFFF**.
- **Preise:** Format `€   6,90` (einstellig 3 Leerzeichen) bzw. `€ 12,50` (zweistellig 1 Leerzeichen).
- **Kontakt-Text links:** Grau **#575757**, 14 pt.
- **Icons:** BCG-Vektor-Icons (Telefon `bcgIcons_FixedCable`, Web, Standort `bcgIcons_Map`)
  in „Group 1".

### Layout-Maße (für exakte Neuanordnung)

- Item-Felder: links **4,562″**, Breite **7,765″** (alle gleich – wichtig, sonst brechen
  lange Zeilen unschön um).
- Preis-Felder: links **12,38″**, Breite **0,90″**.
- Zeilenabstand Gerichte: **0,46″** (Feld-Oberkante zu Oberkante).
- Vorspeisen: erste Zeile bei **0,72″**.
- Hauptgerichte: Überschrift **3,25″**, Trennlinie **3,61″**, erste Zeile **3,75″**.
- Sehr lange Gerichte (z. B. Kalbsrückensteak) mit **manuellem Zeilenumbruch** an einer
  sinnvollen Stelle umbrechen, damit kein einzelnes Wort allein in die zweite Zeile rutscht.

---

## Technischer Hintergrund

- Statische Website über Cloudflare (`wrangler.jsonc`, Projekt `loewen-website`,
  Asset-Verzeichnis = Repo-Root). Kein CI-Workflow – der Deploy wird durch die Git-Anbindung
  von Cloudflare ausgelöst, sobald auf `main` gepusht wird (~30 s bis live, per MD5-Vergleich bestätigt).
- Die PDF liegt als statisches Asset direkt im Root: `https://loewen-forst.de/speisekarte.pdf`.

### Automatisierter Weg (optional, z. B. mit Claude Code)

Falls kein PowerPoint-Handbetrieb gewünscht ist, lässt sich die Karte skriptgesteuert bauen:

- **Bearbeiten:** `python-pptx` – die Gerichte liegen als Textfeld-Paare `Item NNNN` /
  `Price NNNN`; Namen/Preise per Run-Text ersetzen, Positionen wie oben setzen,
  überzählige Felder löschen.
- **PDF/PNG-Export:** PowerPoint per PowerShell-COM-Automation
  (`Presentations.Open(...).SaveAs(out, 32)` für PDF; `Slides.Item(1).Export(out,"PNG",w,h)` für PNG) –
  LibreOffice ist auf dem Rechner nicht installiert.
- **Deploy-Check:** Live-PDF per `curl` laden und MD5 mit der lokalen Datei vergleichen.

Gut zu wissen: Die Kontakt-Textfelder links stecken in „Group 1" mit einem
**Koordinaten-Versatz (~0,31″)** – slide-level platzierte Elemente müssen auf die tatsächlich
gerenderte Textposition (nicht den Feld-Top) ausgerichtet werden.
