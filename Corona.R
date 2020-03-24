#install packages
install.packages("readxl")

#read packages
library(readxl)
library(httr)
library(rstudioapi)
library(ggplot2)

#source functions
source("functions/functions.R")

#set working directory to save location
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

#make data directory
if (!dir.exists('data')) {
  dir.create('data')
}

#create the URL where the dataset is stored with automatic updates every day
url <- paste("https://www.ecdc.europa.eu/sites/default/files/documents/COVID-19-geographic-disbtribution-worldwide-",format(Sys.time(), "%Y-%m-%d"), ".xlsx", sep = "")

#download the dataset from the website to a local temporary file
GET(url, authenticate(":", ":", type="ntlm"), write_disk("./data/wordwide.xlsx"))

#read the Dataset sheet into "R"
data <- read_excel(tf)

#subset data to march only
data = subset(data, Month == 3 )

#ggplot(data_NED, aes(Deaths,Cases)) +
#  geom_point()

#plot cases plots deaths and cases for a country
plot_cases("Netherlands",data)
plot_cases("China",data)
plot_cases("Belgium",data)

#plot_countries compares countries for deaths or cases
countries = c("Netherlands","Germany","Belgium")
plot_countries(countrylist = countries, dataset = data, Deaths_or_Cases = "Cases")

#remove data
file.remove("data/wordwide.xlsx")
