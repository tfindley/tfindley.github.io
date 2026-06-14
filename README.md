# HUGO deployment for tfindley.co.uk

[![Deploy Hugo site to Pages](https://github.com/tfindley/tfindley.github.io/actions/workflows/hugo.yaml/badge.svg)](https://github.com/tfindley/tfindley.github.io/actions/workflows/hugo.yaml)

This is the HUGO deployment for my Personal Webpage, hosted in Github.io.

It is built using [HUGO](https://gohugo.io/) and the [Blowfish](https://blowfish.page/) theme.

The site can be accessed at its real URL, [tfindley.co.uk](https://tfindley.co.uk), or at its GitHub IO link at [tfindley.github.io](https://tfindley.github.io).

## Local development

```bash
# Serve locally with drafts visible
hugo server -D

# Production-style build (matches CI)
hugo --gc --minify
```

Requires Hugo Extended (CI version is pinned in [.github/workflows/hugo.yaml](.github/workflows/hugo.yaml)) and Dart Sass.

## Theme submodule (Blowfish)

The Blowfish theme lives at `themes/blowfish/` as a **git submodule** tracking the upstream `main` branch.

### First-time clone

```bash
git clone --recurse-submodules git@github.com:tfindley/tfindley.github.io.git
```

If you already cloned without `--recurse-submodules`:

```bash
git submodule update --init --recursive
```

### Update the theme to the latest upstream release

```bash
# Pull the latest commit from the tracked branch (main)
git submodule update --remote --merge themes/blowfish

# Confirm the new pointer
git submodule status

# Commit the pointer change
git add themes/blowfish
git commit -m "chore: bump Blowfish theme"
```

To pin to a specific tag instead of tracking `main`:

```bash
cd themes/blowfish
git fetch --tags
git checkout v2.103.0       # replace with desired tag
cd ../..
git add themes/blowfish
git commit -m "chore: pin Blowfish to v2.103.0"
```

### After pulling on a fresh machine / new branch

If `git status` shows `themes/blowfish (new commits)` or the site fails to render, the submodule pointer has moved — re-sync it:

```bash
git submodule update --init --recursive
```

## Deployment

Pushes to `main` trigger [.github/workflows/hugo.yaml](.github/workflows/hugo.yaml), which builds with Hugo Extended + Dart Sass and publishes to GitHub Pages. Custom domain (`tfindley.co.uk`) is set via the `CNAME` file.
