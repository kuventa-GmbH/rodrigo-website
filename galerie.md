---
layout: default
title: Galerie
description: Platzhalterseite für Referenzen und Projektbilder des Handwerkerbetriebs aus Rösrath.
permalink: /galerie/
nav_section: galerie
---
{% assign handwerk = site.data.handwerk %}
{% include handwerk/page-hero.html hero=handwerk.pages.galerie %}

<section class="section">
  <div class="container">
    <div class="gallery-placeholder js-anim" data-anim="animate__fadeInUp" data-once="true">
      <div class="gallery-placeholder__icon" aria-hidden="true">
        <span data-lucide="image"></span>
      </div>
      <h2>Hier entstehen bald Einblicke in abgeschlossene Projekte.</h2>
      <p>Bis die Galerie ergänzt ist, können Sie mir Ihr Vorhaben gern direkt schicken - am einfachsten per WhatsApp, gern auch schon mit Foto.</p>
    </div>
  </div>
</section>

{% include handwerk/contact-band.html
  kicker="Kontakt"
  title="Schon ein Projekt im Kopf?"
  text="Schreiben Sie mir kurz, was ansteht. So kann ich schneller einschätzen, wie ich helfen kann."
  actions_key="project"
%}
