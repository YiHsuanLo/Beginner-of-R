#Practice 5.1

#I want to make an interactive map of temples and shrines in Japan because their 
#beautiful architectures and the story behind them always attract me.

#In this practice, I choose five famous shrines in Kyoto as my targets. 


#Load packages
library(dplyr)
library(leaflet)
library(htmltools)

#Create a website list of shrines 
website <- list(paste(sep = "<br/>",
                      "<b><a href='http://www.shimogamo-jinja.or.jp/'>Shimogamo-jinja Shrine</a></b>",
                      "Address: 59 Shimogamo Izumigawa-cho, Sakyo-ku, Kyoto-shi, Kyoto-fu"),
                paste(sep = "<br/>",
                      "<b><a href='http://www.heianjingu.or.jp/'>Heian-jingu Shrine</a></b>",
                      "Address: Okazaki Nishitenno-cho, Sakyo-ku, Kyoto-shi, Kyoto-fu"),
                paste(sep = "<br/>",
                      "<b><a href='https://kifunejinja.jp//'>Kifune-jinja Shrine</a></b>",
                      "Address: 180 Kuramakibune-cho, Sakyo-ku, Kyoto-shi, Kyoto-fu"),
                paste(sep = "<br/>",
                      "<b><a href='https://www.yasaka-jinja.or.jp/'>Yasaka-jinja Shrine</a></b>",
                      "Address: 625 Gionmachi Kitagawa, Higashiyama-ku, Kyoto-shi, Kyoto-fu"),
                paste(sep = "<br/>",
                      "<b><a href='http://inari.jp/'>Fushimi Inari Taisha Shrine</a></b>",
                      "Address: 68 Yabunouchi-cho, Fushimi-ku, Kyoto-shi, Kyoto-fu"))


#Create the coordinates of shrines
coordinates <- data.frame(
  lng=c(135.77301837107808,135.7824212094381,135.76299373066487,135.77848690372895,135.77266802805138),
  lat=c(35.03918552778883,35.01599106651845,35.12170566625374,35.003680656658034,34.96715169924683))


#Names of shrines
Name <- c("Shimogamo-jinja Shrine","Heian-jingu Shrine","Kifune-jinja Shrine","Yasaka-jinja Shrine","Fushimi Inari Taisha Shrine")


#Make an interactive map
jinja <- leaflet() %>%
  setView(135.8, 35.05, zoom=12) %>% 
  addProviderTiles(providers$Esri.WorldStreetMap) %>%
  addMarkers(coordinates$lng, coordinates$lat, 
             icon=list(iconUrl="https://cdn-icons-png.flaticon.com/128/1623/1623664.png",iconSize=c(50,50)),
             popup=website) %>%
  addPopups(coordinates$lng, coordinates$lat, Name, options=popupOptions(closeButton=TRUE))

jinja


#This map shows you the location of all five shrines at first, 
#and then you can click the link in the marker to explore the website of shrines.
