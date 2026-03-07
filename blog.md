---
layout: default
title: Insights
permalink: /blog/
nav_order: 4
---

<section class="blog-page section">
  <div class="container">
    <header class="blog-header">
      <p class="blog-kicker">Wissensbeiträge</p>
      <h1 class="sec-heading">Insights</h1>
      <p>Praxisnahe Beiträge zu Identity-Architektur, moderner Authentifizierung und Security in gewachsenen IT-Landschaften.</p>
    </header>

    <div class="blog-feed">
      {% for post in site.posts %}
        <article class="blog-entry">
          <a class="blog-entry-media" href="{{ post.url | relative_url }}">
            <img
              src="{{ post.hero_image | default: '/assets/img/blog/professional-reviewing-documents-and-laptop-in-an.png' | relative_url }}"
              alt="{{ post.hero_alt | default: post.title }}"
              loading="lazy" />
          </a>
          <div class="blog-entry-body">
            <p class="blog-date">{{ post.date | date: "%d.%m.%Y" }}</p>
            <h2><a href="{{ post.url | relative_url }}">{{ post.title }}</a></h2>
            {% if post.excerpt %}
              <p>{{ post.excerpt | strip_html | truncate: 260 }}</p>
            {% endif %}
            <a class="blog-entry-link" href="{{ post.url | relative_url }}">Beitrag lesen</a>
          </div>
        </article>
      {% endfor %}
    </div>
  </div>
</section>
