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
make _exporter_gitlab-ci

# export to github actions
make _exporter_github

# export to travis
make _exporter_travis

# export to circle ci
make _exporter_circle-ci
```

## how it works

The script will read `Makefile` and execute `make -qp`. It will return all explicit and implicit make targets.

For better result add and prefix in your Makefile target name like this.

```Makefile
lint.python:
  ...

test.unit:
  ...

test.dast:
  ...

deploy.heroku:
  ...
```

or using slash as separator.

```Makefile
lint/python:
  ...

test/unit:
  ...

test/dast:
  ...

deploy/heroku:
  ...
```
The prefix will be used as job **stage** and run in parallel at **gitlab-ci** and **travis**.

If not added prefix, the stage name will be the same as target name.

## exclude targets

To exclude a target in exporter generator the first letter of target name needs to be different of following regex **[a-zA-Z]**.

> \* suggest start with **_** underscore.