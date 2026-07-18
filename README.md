# Nexus Migration Util

This tool designed to download and upload artifacts from Nexus

<h1 align="center">Welcome to Nexus Migration Util 👋</h1>
<p>
  <a href="https://github.com/rluvaton/nexus-migration-util/blob/master/LICENSE" target="_blank">
    <img alt="License: MIT" src="https://img.shields.io/github/license/rluvaton/nexus-migration-util" />
  </a>
</p>

> CLI tool written in NodeJS for downloading and uploading artifacts from Nexus
> 
> This project is heavily based on [Sébastien Gérard](https://github.com/sebge2emasphere) [gist](https://gist.github.com/sebge2emasphere/497cb264b32ac39a80864c864d522906)

### 🏠 [Homepage](https://github.com/rluvaton/nexus-migration-utilr)

## Install

```bash
npm i nexus-migration-util -g
```

## Usage

```bash
$ nexus-migration-util -h
Usage: nexus-migration-util <command> [options]

Commands:
  nexus-migration-util download  Download from Nexus
  nexus-migration-util upload    Upload to nexus

Options:
  --version             Show version number  [boolean]
  -u, --url             URL of the nexus  [string] [required]
  --user, --nexus-user  The username for nexus  [string] [required]
  --pass, --nexus-pass  The password for the nexus username  [string] [required]
  -h, --help            Show help  [boolean]

```

## Docker

Docker Compose builds the tool with Node.js 22 and mounts the local `./data`
directory at `/data` in the container. Files downloaded to `/data` remain
available on the host after the container exits.

### Build the image

```bash
mkdir -p data
docker compose build
```

Show the CLI help:

```bash
docker compose run --rm nexus-migration
```

### Download artifacts

```bash
docker compose run --rm nexus-migration \
  download \
  --url https://nexus.example.com \
  --user USERNAME \
  --pass PASSWORD \
  --output /data/artifacts \
  --index /data/index.json
```

To limit the download to specific repositories, append one or more repository
names after `--include-repo`. Use `--ignore-repo` instead to exclude
repositories.

### Upload artifacts

```bash
docker compose run --rm nexus-migration \
  upload \
  --url https://target-nexus.example.com \
  --user USERNAME \
  --pass PASSWORD \
  --index-path /data/index.json \
  --artifact-dir-path /data/artifacts
```

An optional repository mapping file stored under `./data` can be supplied with
`--repository-mapper /data/repository-mapper.json`.

### Run commands inside the container

Start an interactive shell while retaining the `/data` mount:

```bash
docker compose run --rm --entrypoint sh nexus-migration
```

From the container shell, invoke the tool directly:

```sh
node /app/bin/cli.js --help

node /app/bin/cli.js download \
  --url https://nexus.example.com \
  --user USERNAME \
  --pass PASSWORD \
  --output /data/artifacts \
  --index /data/index.json
```

Type `exit` to stop and remove the temporary container. Files written beneath
`/data` are retained in the host's `./data` directory.

## Author

👤 **Raz Luvaton**

* Github: [@rluvaton](https://github.com/rluvaton)
* LinkedIn: [@rluvaton](https://linkedin.com/in/rluvaton)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!<br />Feel free to check [issues page](https://github.com/rluvaton/nexus-migration-util/issues/).

## Show your support

Give a ⭐️ if this project helped you!

## 📝 License

Copyright © 2020 [Raz Luvaton](https://github.com/rluvaton). <br>
This project is [MIT](https://github.com/rluvaton/nexus-migration-util/blob/master/LICENSE) licensed.
