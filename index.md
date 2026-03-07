---
layout: default
title: Start
description: Freundliche Handwerksarbeiten rund ums Haus in Rösrath und Umgebung.
permalink: /
nav_section: start
---
{% assign handwerk = site.data.handwerk %}

<section class="section craft-hero">
  <div class="container craft-hero__inner">
    <div class="craft-hero__copy js-anim" data-anim="animate__fadeInLeft" data-once="true">
      <p class="eyebrow">{{ handwerk.site.tagline }}</p>
      <h1 class="hero-title">{{ handwerk.home.hero.title }}</h1>
      <p class="hero-text">{{ handwerk.home.hero.text }}</p>
      {% include handwerk/contact-actions.html key="hero" %}
    </div>

    <aside class="craft-hero__panel js-anim" data-anim="animate__fadeInRight" data-once="true">
      <p class="craft-hero__panel-kicker">Was Sie erwarten können</p>
      <div class="craft-hero__badge-list">
        {% for badge in handwerk.home.hero.badges %}
          <div class="info-pill">
            <span aria-hidden="true" data-lucide="{{ badge.icon }}"></span>
            <span>{{ badge.label }}</span>
          </div>
        {% endfor %}
      </div>
      <p class="craft-hero__panel-text">Ich übernehme Projekte im Raum Rösrath, halte Absprachen unkompliziert und arbeite so, wie man es sich von einem lokalen Handwerker wünscht: freundlich, ordentlich und verlässlich.</p>
    </aside>
  </div>
</section>

<section class="section">
  <div class="container intro-grid">
    <div class="section-intro js-anim" data-anim="animate__fadeInLeft" data-once="true">
      <p class="eyebrow">Vorstellung</p>
      <h2 class="sec-heading">{{ handwerk.home.intro.heading }}</h2>
      <p>{{ handwerk.home.intro.text }}</p>
    </div>

    <div class="feature-stack">
      {% for item in handwerk.home.intro.highlights %}
        <article class="feature-card js-anim" data-anim="animate__fadeInUp" data-once="true" data-delay="{{ forloop.index0 | times: 80 }}">
          <div class="feature-card__icon" aria-hidden="true">
            <span data-lucide="{{ item.icon }}"></span>
          </div>
          <div>
            <h3>{{ item.title }}</h3>
            <p>{{ item.text }}</p>
          </div>
        </article>
      {% endfor %}
    </div>
  </div>
</section>

{% include handwerk/service-grid.html
  kicker="Leistungen"
  heading="Womit ich Sie unterstützen kann"
  text="Drei Bereiche, in denen ich häufig arbeite - klar, sauber und mit persönlicher Abstimmung."
%}

<section class="section section-alt">
  <div class="container">
    <div class="section-intro section-intro--center js-anim" data-anim="animate__fadeInUp" data-once="true">
      <p class="eyebrow">Vertrauen</p>
      <h2 class="sec-heading">{{ handwerk.home.reasons.heading }}</h2>
    </div>

    <div class="reason-grid">
      {% for item in handwerk.home.reasons.items %}
        <article class="reason-card js-anim" data-anim="animate__fadeInUp" data-once="true" data-delay="{{ forloop.index0 | times: 100 }}">
          <div class="reason-card__icon" aria-hidden="true">
            <span data-lucide="{{ item.icon }}"></span>
          </div>
          <h3>{{ item.title }}</h3>
          <p>{{ item.text }}</p>
        </article>
      {% endfor %}
    </div>
  </div>
</section>

{% include handwerk/contact-band.html
  kicker="Kontakt"
  title=handwerk.home.cta.title
  text=handwerk.home.cta.text
  actions_key=handwerk.home.cta.actions_key
%}
