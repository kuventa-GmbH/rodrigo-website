# Galerie pflegen

So fuegst du neue Projekte und neue Bilder fuer bestehende Projekte hinzu.

## Neues Projekt anlegen

1. Erstelle unter `assets/img/galerie/` einen neuen Ordner.
2. Verwende fuer den Ordnernamen nur Kleinbuchstaben und Bindestriche.
3. Lege die Projektbilder in diesen Ordner.

Beispiel:

```text
assets/img/galerie/terrasse-neu/
```

## Bilder hinzufuegen

- Erlaubte Formate: `.jpg`, `.jpeg`, `.png`, `.webp`
- Vermeide Leerzeichen und Sonderzeichen in Dateinamen.
- Die Reihenfolge in der Galerie ergibt sich aus dem alphabetischen Dateinamen.

Beispiel:

```text
assets/img/galerie/terrasse-neu/terrasse-neu-01.jpeg
assets/img/galerie/terrasse-neu/terrasse-neu-02.jpeg
assets/img/galerie/terrasse-neu/terrasse-neu-03.jpeg
```

## Lokalen Build aktualisieren

Nach neuen Bildern oder Projekten einmal ausfuehren:

```bash
ruby scripts/generate_gallery_pages.rb
bundle exec jekyll build
```

Dadurch werden automatisch erzeugt:

- `_data/gallery_projects.yml`
- `_data/gallery_categories.yml`
- `galerie/<projekt>.md`

## Deployment auf GitHub Pages

Beim Push auf `main` fuehrt GitHub Actions automatisch zuerst `ruby scripts/generate_gallery_pages.rb` und danach den Jekyll-Build aus.

Das heisst:

- Neue Projektordner in `assets/img/galerie/` erscheinen nach dem Deploy automatisch in der Galerie.
- Zusätzliche Bilder in bestehenden Projektordnern erscheinen ebenfalls automatisch.

## Hinweise zu Titeln und Kategorien

Titel, Beschreibung und Kategorie werden aktuell aus dem Ordnernamen abgeleitet. Fuer einige bestehende Projekte gibt es manuelle Ueberschreibungen im Script:

- `scripts/generate_gallery_pages.rb`

Wenn ein neues Projekt einen schoeneren Titel oder eine individuellere Beschreibung bekommen soll, dort die entsprechenden `*_OVERRIDES` erweitern.
