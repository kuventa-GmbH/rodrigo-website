---
layout: default
title: Kontakt
description: Kontakt per WhatsApp, Telefon oder E-Mail für Handwerksprojekte in Rösrath und Umgebung.
permalink: /kontakt/
nav_section: kontakt
---
{% assign handwerk = site.data.handwerk %}
{% include handwerk/page-hero.html hero=handwerk.pages.kontakt %}

<section class="section">
  <div class="container contact-layout">
    <div class="contact-methods">
      {% assign method_order = "whatsapp,phone,email" | split: "," %}
      {% for method_name in method_order %}
        {% assign method = handwerk.contact[method_name] %}
        <article class="contact-card{% if forloop.last %} contact-card--wide{% endif %} js-anim" data-anim="animate__fadeInUp" data-once="true" data-delay="{{ forloop.index0 | times: 100 }}">
          <div class="contact-card__icon" aria-hidden="true">
            <span data-lucide="{{ method.icon }}"></span>
          </div>
          <p class="eyebrow">{{ method.label }}</p>
          <h2>{{ method.value }}</h2>
          <p>{{ method.note }}</p>
          <a class="action-pill action-pill--{% if method_name == 'phone' %}primary{% else %}secondary{% endif %}" href="{{ method.href }}" {% if method.href contains 'http' %}target="_blank" rel="noopener noreferrer"{% endif %}>
            <span class="action-pill__icon" aria-hidden="true" data-lucide="{{ method.icon }}"></span>
            <span>{{ method.cta }}</span>
          </a>
        </article>
      {% endfor %}
    </div>

    <aside class="contact-sidecard js-anim" data-anim="animate__fadeInRight" data-once="true">
      <p class="eyebrow">Einfach schreiben oder anrufen</p>
      <h2 class="sec-heading">So wird die Anfrage leicht</h2>
      <p>Eine kurze Nachricht reicht völlig aus. Hilfreich sind zum Beispiel diese Infos:</p>
      <ul class="detail-list detail-list--compact">
        <li>
          <span aria-hidden="true" data-lucide="check"></span>
          <span>Worum es ungefähr geht</span>
        </li>
        <li>
          <span aria-hidden="true" data-lucide="check"></span>
          <span>In welchem Ort das Projekt stattfindet</span>
        </li>
        <li>
          <span aria-hidden="true" data-lucide="check"></span>
          <span>Ob Fotos oder Maße schon vorhanden sind</span>
        </li>
      </ul>
    </aside>
  </div>
</section>
