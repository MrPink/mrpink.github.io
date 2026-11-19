# Personal Tech Blog — Design

## Intent
A personal blog for writing to practitioners in security, DevOps and SRE, building credibility with that community. Personal, not affiliated with VulnCheck.

## Goals
- Publishing a post = add a Markdown file + `git push`; live in ~1 minute.
- Technical readability: syntax highlighting, code copy buttons, Mermaid diagrams, TOC on long posts.
- Discoverability: RSS, tags, Open Graph/social cards, site search.
- Credibility: about page, GitHub/LinkedIn links, dark/light mode, fast pages.

## Non-goals
Comments, newsletter, analytics, custom domain (all can be added later).

## Anti-goals
Trackers or third-party scripts beyond Mermaid; VulnCheck branding.

## Constraints
- Hosted on GitHub Pages under account `mrpink-vulncheck` for now (may move to a personal account later — keep `baseURL` the only account-specific setting).

## Approaches
| Option | Trade-off |
|---|---|
| **Hugo + PaperMod (chosen)** | Single binary, few dependencies, fastest publishing; deep theme customization needs Go templates |
| Jekyll + Chirpy | Native to Pages, popular with security bloggers; Ruby toolchain, slower, busier look |
| Astro + AstroPaper | Most flexible; heavy npm dependency maintenance |

Chosen by Claude at the user's request ("whatever you think").

## Decided
- Repo `mrpink-vulncheck.github.io`, branch `main`.
- PaperMod as a Hugo module (pinned in `go.mod`).
- GitHub Actions deploys to Pages with a pinned Hugo extended version.
- Content: about page, one sample post demonstrating code + Mermaid, README with "how to write a post".

## Left to the builder
Tag taxonomy, menu layout, sample post content, Mermaid integration details.
