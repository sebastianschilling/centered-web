# Website für Centered

Vier statische Seiten, kein Build, kein JavaScript, **keine externe Anfrage** – die Seite
lädt weder Schriften noch Skripte von fremden Servern. Das ist kein Selbstzweck: Nur so
bleibt die Datenschutzerklärung so kurz, wie sie ist.

| Datei | Zweck |
|---|---|
| `index.html` | Landingpage und Presse-Kit (en-US) |
| `support.html` | **Support URL** für App Store Connect (en-US) |
| `datenschutz.html` | Datenschutzerklärung – englische Kurzfassung, deutscher Volltext |
| `privacy.html` | Nur Weiterleitung auf `datenschutz.html` (alte **Privacy Policy URL**, nicht löschen) |
| `impressum.html` | Impressum nach § 5 DDG |
| `styles.css`, `images/` | Design und Bilder (Redesign aus `design/centered-website/` im Hauptrepo, siehe dortige `WEBSITE-SPEC.md`) |
| `videos/` | Clips für „The idea“ auf der Startseite (siehe unten) |

Kopf und Fuß stehen in jeder Seite einzeln – ohne Generator gibt es keine Partials. Wer
dort etwas ändert, ändert es in allen vier Dateien.

## Clips für „The idea“

Die Startseite bindet vier Clips bereits ein. Solange eine Datei fehlt, bleibt der
gestrichelte Platzhalter sichtbar; liegt sie in `videos/`, verdeckt das Video ihn.

| Datei (je `.mp4` + `.jpg` als Standbild) | Inhalt |
|---|---|
| `idea-upright-before` | Hochkant-Clip 9:16, ganze Wand im Bild, **gelber Rahmen eingerendert** |
| `idea-upright-after` | Daraus gerendertes 9:16-Video |
| `idea-sideways-before` | Querformat-Clip 16:9, ganze Fläche im Bild, **gelber Rahmen eingerendert** |
| `idea-sideways-after` | Daraus gerendertes 9:16-Video |

H.264-MP4 ohne Ton, 6–10 s, höchstens ~1,5 MB, mit `-movflags +faststart`. Das `.jpg` ist
Poster und zugleich das Standbild bei „Bewegung reduzieren“. Die `aria-label` in
`index.html` beschreiben den Inhalt – an die echten Clips anpassen. Wenn alle vier liegen,
können die Platzhalter (`.ph`-Text, `.crop`) aus dem HTML raus.

## Vor dem ersten Livegang ausfüllen

`./deploy.sh` bricht ab, solange in einer Seite `AUSFÜLLEN` oder `class="todo"` steht. Zu erledigen:

- [x] Anschrift, Umsatzsteuer, E-Mail-Anbieter, Aufsichtsbehörde
- [ ] Die vier Clips für „The idea“ (siehe oben)
- [ ] Nach der Freigabe im Store: `[App Store badge]` in `index.html` durch das offizielle
      Badge ersetzen (SVG lokal in `images/` ablegen, nicht von Apple nachladen), verlinkt
      auf die App-Store-Seite; den Text daneben auf „Free with a small watermark“ kürzen

Die Rechtstexte sind auf diese App zugeschnitten, ersetzen aber keine Rechtsberatung.

## Lokal ansehen

```bash
python3 -m http.server 8000 --directory web
```

## Veröffentlichen

Gehostet auf GitHub Pages aus einem **eigenen öffentlichen Repo**, damit der App-Quellcode
privat bleibt. Einmalig einzurichten:

1. Auf github.com ein öffentliches Repo `sebastianschilling/centered-web` anlegen (leer,
   ohne README).
2. Im Hauptrepo:
   `git remote add centered-web git@github.com:sebastianschilling/centered-web.git`
3. `./web/deploy.sh` – überträgt per `git subtree` nur den Inhalt von `web/`.
4. Im neuen Repo: Settings → Pages → Source „Deploy from a branch“, Branch `main`, Ordner `/`.
5. DNS beim Registrar (die Domain liegt bei Namecheap):
   `CNAME  centered  →  sebastianschilling.github.io`.
   Danach in Pages „Enforce HTTPS“ aktivieren, sobald das Zertifikat ausgestellt ist.

Die Datei `CNAME` in diesem Ordner setzt die Domain, `.nojekyll` schaltet die
Jekyll-Verarbeitung ab.

## In App Store Connect eintragen

- Support URL: `https://centered.sebastianschilling.com/support.html`
- Privacy Policy URL: `https://centered.sebastianschilling.com/datenschutz.html`
  (die alte `…/privacy.html` leitet weiter und funktioniert ebenfalls)
- Marketing URL (optional): `https://centered.sebastianschilling.com/`
