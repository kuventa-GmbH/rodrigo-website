---
layout: default
title: Leistungen
description: Innenausbau, Renovierung, Badsanierung, Bauplanung und Außenarbeiten in Rösrath und Umgebung.
permalink: /leistungen/
nav_section: leistungen
---
{% assign handwerk = site.data.handwerk %}

{% include handwerk/page-hero.html hero=handwerk.pages.leistungen %}

{% include handwerk/service-grid.html
  kicker="Leistungsbereiche"
  heading="Drei Bereiche, in denen ich häufig unterstütze"
  text="Jede Leistung kann einzeln beauftragt oder mit anderen Arbeiten kombiniert werden - immer passend zum Projekt und zum vorhandenen Bestand."
%}

<section class="section section-alt">
  <div class="container compact-grid">
    <article class="compact-card js-anim" data-anim="animate__fadeInUp" data-once="true">
      <span class="compact-card__icon" aria-hidden="true" data-lucide="message-circle"></span>
      <h3>Klare Abstimmung</h3>
      <p>Vor Beginn sprechen wir durch, was gemacht werden soll, welcher Umfang sinnvoll ist und wie die Arbeiten ablaufen.</p>
    </article>

    <article class="compact-card js-anim" data-anim="animate__fadeInUp" data-once="true" data-delay="100">
      <span class="compact-card__icon" aria-hidden="true" data-lucide="sparkles"></span>
      <h3>Ordentliche Ausführung</h3>
      <p>Ich arbeite sauber und achte darauf, dass Ihr Zuhause während und nach dem Projekt ordentlich behandelt wird.</p>
    </article>

    <article class="compact-card js-anim" data-anim="animate__fadeInUp" data-once="true" data-delay="200">
      <span class="compact-card__icon" aria-hidden="true" data-lucide="map-pin"></span>
      <h3>Regional unterwegs</h3>
      <p>Der Schwerpunkt liegt auf Projekten in Rösrath und im Umkreis von etwa 50 km - mit kurzen Wegen und persönlichem Kontakt.</p>
    </article>
  </div>
</section>

{% include handwerk/contact-band.html
  kicker="Unkompliziert anfragen"
  title="Passt Ihr Vorhaben zu einer dieser Leistungen?"
  text="Dann lassen Sie uns kurz darüber sprechen. Oft reicht schon eine kurze Beschreibung oder ein Foto per WhatsApp."
  actions_key="project"
%}
