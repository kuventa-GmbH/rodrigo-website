# frozen_string_literal: true

module GalleryProjects
  module_function

  GALLERY_ROOT = "assets/img/galerie"
  PROJECT_ICON = "hammer"

  TITLE_OVERRIDES = {
    "balkon-ausbau" => "Balkonausbau",
    "dachgeschoss-ausbau" => "Dachgeschossausbau",
    "einfahrt" => "Einfahrt neu gestaltet",
    "eingang-gepflastert" => "Eingangsbereich gepflastert",
    "eingangstuer-einbau" => "Eingangstür eingebaut",
    "fassade-gemalt" => "Fassade frisch gestrichen",
    "glasdach" => "Glasdach montiert",
    "hauseingangstuer-einbau" => "Hauseingangstür eingebaut",
    "parkett-fussleisten-tuer" => "Parkett mit Fußleisten und Türabschluss",
    "parkett-verlegen" => "Parkett sauber verlegt",
    "pflasterweg" => "Pflasterweg angelegt",
    "wohnkuechenausbau" => "Wohnküche ausgebaut",
    "wohnzimmerschrank" => "Wohnzimmerschrank eingebaut",
    "zaunbau" => "Zaunbau am Grundstück"
  }.freeze

  DESCRIPTION_OVERRIDES = {
    "balkon-ausbau" => "Hier wurde ein Balkon sauber weiter ausgebaut und an die vorhandene Situation angepasst. Wichtig war eine ordentliche, praktische Lösung, die zum Haus passt.",
    "dachgeschoss-ausbau" => "Beim Dachgeschossausbau ging es um eine saubere handwerkliche Umsetzung mit stimmigen Details. So ist zusätzlicher Wohnraum entstanden, der sich direkt gut nutzen lässt.",
    "einfahrt" => "Diese Einfahrt wurde neu aufgebaut und klar gegliedert. Das Ergebnis wirkt ordentlich, robust und passt gut zum Eingangsbereich.",
    "eingang-gepflastert" => "Hier wurde der Eingangsbereich neu gepflastert und sauber eingefasst. Dadurch wirkt der Zugang zum Haus deutlich aufgeräumter und einladender.",
    "eingangstuer-einbau" => "Die Eingangstür wurde passend eingebaut und sauber angeschlossen. So sitzt alles ordentlich und der Eingangsbereich wirkt direkt stimmiger.",
    "fassade-gemalt" => "Bei diesem Projekt wurde die Fassade frisch gestrichen und sauber aufgearbeitet. Das Haus hat dadurch wieder einen gepflegten und freundlichen Eindruck.",
    "glasdach" => "Hier wurde ein Glasdach montiert und sauber in den Bestand eingebunden. So entsteht ein geschützter Bereich mit einer leichten, offenen Wirkung.",
    "hauseingangstuer-einbau" => "Die Hauseingangstür wurde erneuert und ordentlich eingebaut. Neben der Optik spielt hier natürlich auch ein sauberer Abschluss rund um den Eingang eine große Rolle.",
    "parkett-fussleisten-tuer" => "Hier kamen Parkett, passende Fußleisten und ein sauberer Türabschluss zusammen. Gerade diese Details sorgen am Ende dafür, dass der Raum ordentlich und fertig wirkt.",
    "parkett-verlegen" => "In diesem Raum wurde ein neuer Parkettboden verlegt und sauber angepasst. Das Ergebnis bringt Ruhe in den Raum und passt gut zu einem wohnlichen Gesamtbild.",
    "pflasterweg" => "Der Weg wurde neu gepflastert und klar geführt. So ist ein praktischer und zugleich sauber wirkender Außenbereich entstanden.",
    "wohnkuechenausbau" => "Beim Ausbau der Wohnküche ging es um eine praktische und stimmige Lösung für den Alltag. Alles wurde so umgesetzt, dass der Raum offen, sauber und gut nutzbar bleibt.",
    "wohnzimmerschrank" => "Hier wurde ein Schrank im Wohnzimmer sauber eingebaut und passend in den Raum integriert. So entsteht zusätzlicher Stauraum, ohne dass der Raum unruhig wirkt.",
    "zaunbau" => "Bei diesem Projekt wurde ein Zaun ordentlich gesetzt und an das Grundstück angepasst. Das sorgt für einen klaren Abschluss und eine saubere Gesamtwirkung."
  }.freeze

  ALT_OVERRIDES = {
    "balkon-ausbau" => "Ausgebauter Balkon am Haus in Rösrath",
    "dachgeschoss-ausbau" => "Ausgebautes Dachgeschoss in Rösrath",
    "einfahrt" => "Neu gestaltete Einfahrt in Rösrath",
    "eingang-gepflastert" => "Gepflasterter Eingangsbereich in Rösrath",
    "eingangstuer-einbau" => "Neu eingebaute Eingangstür in Rösrath",
    "fassade-gemalt" => "Frisch gestrichene Fassade in Rösrath",
    "glasdach" => "Montiertes Glasdach an einem Haus in Rösrath",
    "hauseingangstuer-einbau" => "Neu eingebaute Hauseingangstür in Rösrath",
    "parkett-fussleisten-tuer" => "Parkett mit Fußleisten und Türabschluss in Rösrath",
    "parkett-verlegen" => "Verlegter Parkettboden in Rösrath",
    "pflasterweg" => "Neu gepflasterter Weg in Rösrath",
    "wohnkuechenausbau" => "Ausgebaute Wohnküche in Rösrath",
    "wohnzimmerschrank" => "Eingebauter Wohnzimmerschrank in Rösrath",
    "zaunbau" => "Neu gebauter Zaun in Rösrath"
  }.freeze

  def build(site)
    root = File.join(site.source, GALLERY_ROOT)
    return [] unless Dir.exist?(root)

    Dir.children(root)
      .reject { |name| name.start_with?(".") }
      .map { |name| File.join(root, name) }
      .select { |path| File.directory?(path) }
      .sort_by { |path| display_title(File.basename(path)) }
      .map { |path| build_project(site, path) }
      .reject { |project| project["images"].empty? }
  end

  def build_project(site, absolute_path)
    slug = File.basename(absolute_path)
    relative_dir = "/" + absolute_path.delete_prefix(site.source).sub(%r{^/}, "")

    images = Dir.children(absolute_path)
      .reject { |name| name.start_with?(".") }
      .select { |name| File.file?(File.join(absolute_path, name)) }
      .select { |name| name.match?(/\.(jpe?g|png|webp)$/i) }
      .sort
      .each_with_index
      .map do |filename, index|
        {
          "src" => "#{relative_dir}/#{filename}",
          "alt" => "#{alt_base(slug)} #{index + 1}"
        }
      end

    {
      "slug" => slug,
      "title" => display_title(slug),
      "description" => project_description(slug),
      "icon" => PROJECT_ICON,
      "image_count" => images.length,
      "cover_image" => images.first && images.first["src"],
      "cover_alt" => images.first && images.first["alt"],
      "images" => images
    }
  end

  def display_title(slug)
    TITLE_OVERRIDES.fetch(slug, fallback_title(slug))
  end

  def project_description(slug)
    DESCRIPTION_OVERRIDES.fetch(slug, fallback_description(slug))
  end

  def alt_base(slug)
    ALT_OVERRIDES.fetch(slug, "#{display_title(slug)} in Rösrath")
  end

  def fallback_title(slug)
    slug
      .split("-")
      .map { |part| umlautize(part).capitalize }
      .join(" ")
  end

  def fallback_description(slug)
    "Hier sehen Sie Einblicke in das Projekt #{fallback_title(slug)}. Die Arbeiten wurden sauber abgestimmt und ordentlich umgesetzt."
  end

  def umlautize(value)
    value
      .gsub("ae", "ä")
      .gsub("oe", "ö")
      .gsub("ue", "ü")
      .gsub("ss", "ß")
  end
end

Jekyll::Hooks.register :site, :pre_render do |site|
  site.data["gallery_projects"] = GalleryProjects.build(site)
end
