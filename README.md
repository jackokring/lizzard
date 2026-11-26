# Lizzard and HTMX

It looks good, but only testing will tell. The `make` of `v` gives an error on
my `arm` system, so there maybe some "funny source" on `master` to do with
expanding an `if` condition. The release binary does self compile though.

A simple stack of `postgres`, `v`, `htmx`, and maybe some auxiliary backend
languages such as `lua`, `python`, and others for special functions.

The automation scripting is to be integrated by `just` as a master control
command, and a `justfile`. That seems about complex enough for reasonable
compiled server code with static typing (`v` is similar to `go`) and enough
flexibility to extend the `*.js` ecosystem without relying on its syntax
(which I don't enjoy due to a few coercion issues and ...).

It should be noted that things can only get so far without setting a concrete
project functional goal, and so here's a plan list.

## Plan List

- [ ] Must be cheap to operate due to funding restriction
- [ ] Must be enjoyable enough to be usable many times
- [ ] Must not be something of a clone of something there is much of
- [ ] Must not involve any restricted class of user via authentication (18+)
  - [ ] Not that it's 18+ in nature, just 18+ to enjoy

## TODO List

- [ ] Render markdown to HTML for some resources
- [ ] `@include <file_no_ext>` for nested template (also `@js` and `@css`)
- [ ] Pre-compiled minified bootstrap 5
- [ ] JS (or WASM) for `v`'s backend to make worker for frontend
  - `v -o <*>.js <*>.v` for native JS output, `v -o <*>.c <*>.v` for `C` output
  - `emcc` from package `emscripten` for the WASM (and loading JS) from `C`
  - Bun hack `sudo ln -s $(which bun) /usr/bin/npm` (leaves node offline)
  might need adding in some global or local `bun` (npm) packages
- [ ] TUI monitor of backend
- [ ] Optional GUI monitor of backend or local dev server
- [ ] Look into `vab` Android front end option
  - Seems an install and a new key store key for signing
- [ ] Other `C` based platform frontends option (ANSI)
- [ ] Use `.vsh` for script files
  - [ ] Use `just` embedding or includes `#!` recipes
  - [ ] Maybe even `luajit` and `luarocks install sh` scripting
- [ ] Embed `lua` backend for some uses
- [ ] `just` launch security verify by `: auth_task` before any RPC
  - [ ] No wildcard eval of CLI command lines ever

## All Done List

- [ ] I can't think of anything else to add to the TODO
