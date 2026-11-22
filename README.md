# mrpink.github.io

Personal tech blog on security, DevOps and SRE. Built with [Hugo](https://gohugo.io/) and the [PaperMod](https://github.com/adityatelange/hugo-PaperMod) theme, and deployed to GitHub Pages by GitHub Actions.

Live at <https://mrpink.github.io/>

## Setup

```bash
brew install hugo go
hugo server -D          # preview at http://localhost:1313 (includes drafts)
```

## Write a post

```bash
hugo new content posts/my-post-slug.md
```

Edit the front matter:

```yaml
---
title: "My post title"
date: 2026-11-19
tags: ["kubernetes", "incident-response"]
summary: "One line shown on the post list and in social previews."
draft: true      # remove or set false to publish
---
```

Posts marked `draft: true` show in `hugo server -D` but are never published.

### Diagrams

Use a fenced `mermaid` code block. Mermaid only loads on pages that contain one.

````markdown
```mermaid
flowchart LR
  A --> B
```
````

### Images

Put the post in a folder (`content/posts/my-post/index.md`) with its images next to it, and link them as `![alt text](diagram.png)`.

## Publish

```bash
./scripts/verify.sh     # build + checks (CI runs this too)
git add . && git commit -m "post: my post" && git push
```

A push to `main` builds and deploys in about a minute. Pull requests run the checks without deploying.

## Maintenance

- **Theme update:** `hugo mod get -u github.com/adityatelange/hugo-PaperMod && hugo mod tidy`, then run `./scripts/verify.sh`.
- **Hugo update:** bump `HUGO_VERSION` in `.github/workflows/deploy.yml` to match your local `hugo version`.
- **Moving to another GitHub account:** change `baseURL` in `hugo.toml`, the module path in `go.mod`, and the GitHub link in `hugo.toml` and `content/about.md`.
