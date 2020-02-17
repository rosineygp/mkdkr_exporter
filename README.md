# export

Export Makefile to following pipeline engines:

- gitlab-ci

# usage

## include

Add the following line at mkdkr.csv

```csv
exporter,https://github.com/rosineygp/mkdkr_exporter.git
```
## execute

No needs aditional step in your Makefile (implicit)

```bash
make export.gitlab-ci
```