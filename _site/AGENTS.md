# Repository Guidelines

## Project Structure & Module Organization
This repository is a custom Jekyll website.
- Root pages: `index.md`, `about.md`, `contact.md`, `impressum.md`, `datenschutzerklarung.md`, `404.html`
- Layouts: `_layouts/` (`default.html`, `page.html`, `post.html`)
- Reusable sections/components: `_includes/` (home and about section partials, `navbar.html`, `footer.html`)
- Content data: `_data/*.yml` (structured copy for homepage/about sections)
- Styling and assets: `assets/css/site.scss`, `assets/fonts/`, `assets/img/`
- Posts: `_posts/` with `YYYY-MM-DD-title.markdown`
- Build output: `_site/` (generated artifacts)

## Build, Test, and Development Commands
- `bundle install`: install Ruby gems from `Gemfile`.
- `bundle exec jekyll serve`: run local dev server at `http://127.0.0.1:4000/`.
- `bundle exec jekyll build`: generate static site into `_site/`.
- `bundle exec jekyll clean`: remove generated/cache output before a fresh build.

Use `eval "$(rbenv init - zsh)"` first if Ruby is managed with `rbenv`.

## Coding Style & Naming Conventions
- Use 2-space indentation in HTML/Liquid, YAML, and SCSS.
- Keep Liquid templates split into small includes under `_includes/...` by page/section.
- Use lowercase, hyphenated filenames for posts/pages where possible (example: `_posts/2026-02-10-welcome-to-jekyll.markdown`).
- Prefer data-driven content in `_data/*.yml` over hardcoding long text in templates.
- Edit source styles in `assets/css/site.scss`; `site.css`/maps are generated outputs.

## Testing Guidelines
There is currently no automated test framework in this repo. Validate changes with:
- `bundle exec jekyll build` (must complete without errors)
- Manual checks in browser for affected routes and responsive behavior
- Spot-check generated output in `_site/` for broken links/assets

## Commit & Pull Request Guidelines
Recent history uses short, plain commit subjects (for example: `Animations Added`, `Homepage-inprogress`). Keep messages concise and specific to one change.
- Preferred format: imperative subject, optionally scoped (example: `home: refine hero section spacing`).
- PRs should include: summary, impacted pages/components, before/after screenshots for UI changes, and any follow-up tasks.
- Link related issue(s) when applicable and list manual verification steps.

## Security & Configuration Tips
- Do not commit secrets or private keys.
- Review `_config.yml` changes carefully; some settings require restarting `jekyll serve`.
- Keep external form endpoints (for example Formspree in `_data/home.yml`) environment-appropriate before production deploys.
