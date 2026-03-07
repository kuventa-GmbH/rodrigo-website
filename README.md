# Jekyll Starter (Minimal)

This repo contains a minimal Jekyll setup with custom layouts and a small CSS baseline.

## Requirements
- Ruby 3.x
- Bundler

## Initial start
```bash
eval "$(rbenv init - zsh)"
bundle install
bundle exec jekyll serve
```

Then open `http://127.0.0.1:4000/`.

## Basic structure
- `_layouts/default.html`: global HTML shell (head/body, main wrapper)
- `_layouts/page.html`: basic page layout
- `_layouts/post.html`: basic post layout
- `assets/css/site.css`: minimal styling
- `index.markdown`: homepage content
- `about.markdown`: example page
- `_posts/`: blog posts (optional)

## Add a new page
Create a new `.markdown` file at the project root (or in a `pages/` folder) with:

```yaml
---
layout: page
title: My Page
permalink: /my-page/
---
```

Then add content below the front matter.

## Add a new post (optional)
Create a file in `_posts/` named `YYYY-MM-DD-title.markdown`:

```yaml
---
layout: post
title: My Post
---
```

## Customization
Edit `_layouts/*.html` and `assets/css/site.css` to build your own design.
