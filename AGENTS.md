# AGENTS.md

## Project overview

A backend V (vlang) + frontend htmx progressive web app backed by PostgreSQL.
The server renders HTML and JSON; the client uses htmx for fragment swaps and
a service worker for offline app-shell caching.

<!-- TODO: one paragraph on what the product/app actually does, and who uses it. -->

## Tech stack

- **Runtime / tooling:** V (vlang.io)
- **Language:** V (main.v)
- **HTTP layer:** veb module, static pages in `assets/`, templates in `templates/`
- **Database:** PostgreSQL via the builtin V ORM driver
- **ORM / migrations:** V builtin ORM
- **Frontend:** server-rendered HTML, htmx
- **PWA:** `pwa/worker.js` (hello-world service worker). `pwa/manifest.webmanifest`
  and PNG icons in `assets/icons/` are planned.
- **Client JS:** vendored `assets/htmx.min.js` and `assets/less.js`, loaded by
  `templates/index.html`
- **CSS:** `assets/main.less`, compiled in the browser by `assets/less.js`

<!-- TODO: add anything else as it lands (auth, queues, hosting, CI...). -->

## Commands

| Command | Purpose |
| --- | --- |
| `v install` | Install dependencies |
| `v run main.v` | Dev server |
| `v main.v` | Build binary |
| `v -prod main.v` | Production build with optimizations |

<!-- TODO: add typecheck / lint / test / DB migration commands once scripts exist. -->

## Repository layout

```
.
├── .editorconfig
├── .env
├── .gitattributes
├── .gitignore
├── AGENTS.md
├── assets/
│   ├── htmx.min.js
│   ├── icons/
│   ├── less.js
│   └── main.less
├── justfile
├── main
├── main.v
├── pwa/
│   └── worker.js
├── templates/
│   └── index.html
└── v.mod
```

`main` is a local build artifact; `main` and `.env` are both gitignored.

<!-- TODO: document any new directories (routes/, lib/, tests/, migrations/, etc.). -->

## Conventions

- Add new routes to the V app in `main.v`; it currently holds both routes and
  server startup. Keep `/api*` for JSON.
- Build runtime server HTML/HTMX with `templates/*`.
- Static files are in `assets/*`.
- Keep htmx vendored in `assets/htmx.min.js`; no CDN dependency.
- `.env` is gitignored. DO NOT expose this on github.

<!-- TODO: naming rules, error handling, logging, validation, auth patterns. -->

## Database

- PostgreSQL is accessed through V. Use the builtin ORM.

<!-- TODO: connection helper location, migration/generate commands, seeding,
     table/column naming, and whether migrations should be committed. -->

## PWA notes

- `pwa/worker.js` is registered from `templates/index.html` as `/worker.js`.
- Bump `VERSION` in `pwa/worker.js` whenever a cached asset changes so clients
  pick up the new app shell (caching is still TODO).

<!-- TODO: offline strategy decisions, update prompts, notifications, install flow. -->

## Agent guidelines

- Make small, focused changes that match the surrounding style; leave unrelated
  files (especially vendored assets) alone.
- Never commit secrets or `.env`; don't hand-edit vendored `assets/htmx.min.js`
  or `assets/less.js`.
- Verify changes with `v main.v`, then run `v run .` and check `GET /api` and
  `/assets/main.less` (static MIME errors only show up at startup).
- Update this file when a new convention or stack piece becomes permanent.

<!-- TODO: commit/PR conventions, review expectations, and any hard "do not touch" areas. -->

## Owner TODOs

- [ ] Describe the app's purpose and feature roadmap.
- [ ] Wire up the DB connection, schema, and migration commands.
- [ ] Add typecheck / lint / test scripts (and CI).
- [ ] Document deployment/hosting and environment variables.
- [ ] Add remaining stack pieces as they are adopted.
