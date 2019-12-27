library(knitr)
library(rvest)
library(gsubfn)
library(tidyr)
library(shiny)
library(xml2)
library(proto)

options(gsubfn.engine="R")

# Uvozimo funkcije za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r", encoding="UTF-8")


