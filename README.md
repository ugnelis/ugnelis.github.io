# Edds [![CircleCI](https://circleci.com/gh/Edvinas01/edds.svg?style=svg)](https://circleci.com/gh/Edvinas01/edds)
Minimalistic portfolio, programming, blog site. Live version can be seen 
[here](https://edvinas.dev).

## Setting up
First install [Node.js 10](https://nodejs.org/en/download). Then checkout this 
repo and download dependencies:
```bash
npm install
```

## Scripts
Run a development server (the server will start on `localhost:8080`):
```bash
npm run start
```

Build a production ready site (artifacts will be created under `dist` dir):
```bash
npm run build
```

Deploy the site to [GitHub Pages](https://pages.github.com) (note, this script 
is meant to be run by [CircleCI](https://circleci.com/gh/Edvinas01/edds)):
```bash
./deploy.sh
```

## Other
Stuff I referenced when creating this project:
* https://jgthms.com/web-design-in-4-minutes
* https://github.com/jh3y/parcel-boilerplate
* https://jrl.ninja/etc/1/
