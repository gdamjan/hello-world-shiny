# `hello-world-shiny`

## Goals

Install deps, run shiny app, via shiny server, behind nginx and with certbot/letsencrypt


Deps (R and gcc is installed from OS package):
```
Rscript -e 'install.packages("shiny")'
```
> Notes: 1GB ram is not enough if installing from source!

Run
```
Rscript app.R
```

