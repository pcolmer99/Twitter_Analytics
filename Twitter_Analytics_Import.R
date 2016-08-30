## This code will search and return tweets based on your search criteria 
##   You need to have configured Twitter and run the Twitter_Analytics_Setup
##   code.

## (C) Paul Colmer 2016

## 1 hrs

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

## Setup Search String, number of tweets and load into tweets variable
search.string <- "#MyWorkStyle"
no.of.tweets <- 100
tweets <- searchTwitter(search.string, n=no.of.tweets, lang="en")

## Create a dataframe based on the results
df <- do.call("rbind", lapply(tweets, as.data.frame))

## Count up the posts for each twitter user (screenName)
twitcount <- table(df$screenName)

## Show the counts in a Barplot - las=2 turn x axis lables vertical
##   cex.names=0.5 changes the font size of the x axis text
barplot(twitcount, las=2, cex.names=0.5)