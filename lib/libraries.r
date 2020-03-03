library(knitr)
library(readr)
library(gsubfn)
library(tidyr)
library(shiny)
library(xml2)
library(proto)
library(stringr)
library(tmap)
library(mosaic)
library(rvest)


options(gsubfn.engine="R")

# Uvozimo funkcije za pobiranje in uvoz zemljevida.
source("lib/uvozi.zemljevid.r", encoding="UTF-8")


