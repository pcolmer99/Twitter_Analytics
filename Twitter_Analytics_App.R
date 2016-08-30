## This code will create a Shiny App that will allow you to search Twitter
##   You need to have configured Twitter and run the Twitter_Analytics_Setup
##   code.

## Credit: Paul Colmer 2016

## 2 hrs

## Packages and Libraries already setup in Twitter_Analytics_Setup.R

## Load in the cred object which allows us to access the Twitter acount
load("twitter authentication.Rdata")

## Read in the AccessToken and AccessSecret attributes stored in a
##   local file called TwitterSecret2.txt.  Never make these tokens public 
##   otherwise someone could compromise your Twitter account.

con <- file("TwitterSecret2.xxx","r")
AccessToken <- readLines (con,1)        ## Read first line
AccessSecret <- readLines (con,1)     ## Read next line
close(con)

## Setup the OAuth (Open Authentication and Authorisation) with Twitter 
## using keys and tokens from the Twitter application.
setup_twitter_oauth(TwitKey, TwitSecret, AccessToken, AccessSecret)

## Install Shiny packages
install.packages("shiny")
library(shiny)

#Setup the User Interface
ui <- fluidPage(
  
  ## Text Input Function
  textInput(inputId = "twitsearch",
    label = "Search String: ",
    value= "#MyWorkStyle"),
  
  ## Slider Input Function
  sliderInput(inputId = "twitnum",
    label = "No. of Tweets",
    value = 25, min = 1, max = 500),
  plotOutput("twitchart")
  )

## Setup the Server code
server <- function(input, output) {
  
  ## Include all the code in the reactive function to work in Shiny
  twitcount <- reactive({
    tweets <- searchTwitter(input$twitsearch, n=input$twitnum, lang="en")
    df <- do.call("rbind", lapply(tweets, as.data.frame))
    twitcount <- table(df$screenName)
  })
  
  ## This produces the barplot using twitcount.  It shows the number of
  ##   tweets for each twitter user, that matches the search string
  output$twitchart <- renderPlot({ 
    barplot(twitcount(), las=2, cex.names=0.5)
  })
}

## Knit the UI and Server code together to form a Shiny App
shinyApp(ui = ui, server = server)