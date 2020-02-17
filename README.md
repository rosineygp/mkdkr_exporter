# exporter

[![Build Status](https://img.shields.io/endpoint.svg?url=https%3A%2F%2Factions-badge.atrox.dev%2Frosineygp%2Fmkdkr_commitlint%2Fbadge%3Fref%3Dmaster&style=flat)](https://actions-badge.atrox.dev/rosineygp/mkdkr_exporter/goto?ref=master)
[![Docker Pulls](https://img.shields.io/docker/pulls/rosiney/mkdkr_exporter)](https://hub.docker.com/r/rosiney/mkdkr_exporter)
[![GitHub release (latest by date)](https://img.shields.io/github/v/release/rosineygp/mkdkr_exporter)](https://github.com/rosineygp/mkdkr_exporter/releases)

Export Makefile to following pipeline engines:

- gitlab-ci
- github actions
- travis
- circle-ci

All Makefile user targets is added, including implicit jobs (like [commitlint](https://github.com/rosineygp/mkdkr_commitlint)).

> It exclude itself, cause `exporter` jobs are implicit.

Additional environment variables, flows and error handling needs to be implemented by user.

> This project pipeline is made using [mkdkr_exporter](https://github.com/rosineygp/mkdkr_exporter).

# usage

## include

Add the following line at mkdkr.csv

```csv
exporter,https://github.com/rosineygp/mkdkr_exporter.git
```
## execute

No needs aditional step in your Makefile (implicit)

```bash
# export to gitlab
make exporter.gitlab-ci

# export to github actions
make exporter.github

# export to travis
make exporter.travis

# export to circle ci
make exporter.circle-ci
```