# Edds [![CircleCI](https://circleci.com/gh/Edvinas01/edds.svg?style=svg)](https://circleci.com/gh/Edvinas01/edds)
Minimalistic portfolio, programming, blog site built using 
[Hugo](https://gohugo.io). Live version can be seen 
[here](https://edvinas.dev).

## Prerequisites
Make sure you have [Hugo](https://gohugo.io/getting-started/installing) 
installed.

## Commands
Run a development server (the server will start on `localhost:8080`):
```bash
hugo server --port 8080
```

Build a production ready site (artifacts will be created under `public` dir):
```bash
hugo --minify
```

Deploy the site to [GitHub Pages](https://pages.github.com) (note, this script 
is meant to be run by [CircleCI](https://circleci.com/gh/Edvinas01/edds)):
```bash
./deploy.sh
```

## Other
Stuff I referenced when creating this project:
* https://jgthms.com/web-design-in-4-minutes
* https://jrl.ninja/etc/1
