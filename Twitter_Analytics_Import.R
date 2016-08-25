## This code will search and return tweets based on your search criteria 
##   You need to have configured Twitter and run the Twitter_Analytics_Setup
##   code.

## (C) Paul Colmer 2016

## 0.5 hrs

## Setup Packages and Libraries
## ROAuth:    Provides an interface to the OAuth 1.0 specification
##            allowing users to authenticate via OAuth to the server of their choice.
##            Type ?ROAuth in the console for help
## Twitter:   Provides an interface to the Twitter web API
##            Type ?twitteR in the console for help

install.packages("twitteR")
library("twitteR")
install.packages("ROAuth")
library("ROAuth")

## Setup Working Directory
setwd("C:/Users/pcolmer/OneDrive for Business 1/R Studio/Twitter Analytics")

## Load in the cred object which allows us to access the Twitter acount
load("twitter authentication.Rdata")

## Read in the AccessToken and AccessSecret attributes stored in a
##   local file called TwitterSecret2.txt.  Never make these tokens public 
##   otherwise someone could compromise your Twitter account.

con <- file("TwitterSecret2.xxx","r")
AccessToken <- readLines (con,1)        ## Read first line
AccessSecret <- readLines (con,1)     ## Read next line
close(con)

## Authenticate with Twitter using keys and tokens
setup_twitter_oauth(TwitKey, TwitSecret, AccessToken, AccessSecret)

## Setup Search String, number of tweets and load into tweets variable
search.string <- "#MyWorkStyle"
no.of.tweets <- 50
tweets <- searchTwitter(search.string, n=no.of.tweets, lang="en")
