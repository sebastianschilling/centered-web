# Website für Centered

Vier statische Seiten, kein Build, kein JavaScript, **keine externe Anfrage** – die Seite
lädt weder Schriften noch Skripte von fremden Servern. Das ist kein Selbstzweck: Nur so
bleibt die Datenschutzerklärung so kurz, wie sie ist.

| Datei | Zweck |
|---|---|
| `index.html` | Landingpage und Presse-Kit (en-US) |
| `support.html` | **Support URL** für App Store Connect (en-US) |
| `privacy.html` | **Privacy Policy URL** – englische Kurzfassung, deutscher Volltext |
| `impressum.html` | Impressum nach § 5 DDG |

## Vor dem ersten Livegang ausfüllen

`./deploy.sh` bricht ab, solange irgendwo `AUSFÜLLEN` steht. Zu erledigen:

- [ ] **Anschrift** in `impressum.html` und in `privacy.html` (Punkt 1)
- [ ] **Umsatzsteuer**: in `impressum.html` Variante A (USt-IdNr.) oder B
      (Kleinunternehmer § 19 UStG) behalten, die andere löschen
- [ ] **E-Mail-Anbieter** in `privacy.html` (Punkt 4) – wer `centered@…` technisch betreibt
- [ ] **Aufsichtsbehörde** in `privacy.html` (Punkt 5) – die des eigenen Bundeslandes
- [ ] `assets/og-image.png` (1200 × 630) anlegen, sonst zeigen Messenger nur Text
- [ ] Nach der Freigabe im Store: App-Store-Link und Apple-Badge in `index.html`
      (Badge-Grafik lokal in `assets/` ablegen, nicht von Apple nachladen)

Screenshot- und Videoflächen sind als gestrichelte Kästen angelegt und beschriftet; sie
lassen sich einzeln durch `<img>` bzw. `<video muted loop playsinline>` ersetzen.

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
- Privacy Policy URL: `https://centered.sebastianschilling.com/privacy.html`
- Marketing URL (optional): `https://centered.sebastianschilling.com/`
