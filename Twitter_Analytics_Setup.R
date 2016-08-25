## This code will setup the necessary handshake between R and Twitter
## to allow an extract of your twitter handle analytics.

## (C) Paul Colmer 2016

## 1.5 hrs

## Follow this article to understand the pre-requisites you need to setup in Twitter
## https://www.credera.com/blog/business-intelligence/twitter-analytics-using-r-part-1-extract-tweets/
## Credits:  Sugandha Choudhary & Baiey Adam

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

## Download a root certificate from the Mozilla CA Cert Store
## Mozilla CA Certs are designef for use in open source, cross-platform projects
download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")

## Read in the ConsumerKey and ConsumerSecret attributes stored in a
##   local file called TwitterSecret.txt.  Never make these keys public 
##   otherwise someone could compromise your Twitter account.

con <- file("TwitterSecret.xxx","r")
TwitKey <- readLines (con,1)        ## Read first line
TwitSecret <- readLines (con,1)     ## Read next line
close(con)

## Generate the Authentication token and store in cred.
cred <- OAuthFactory$new(consumerKey=TwitKey,
                         consumerSecret=TwitSecret,
                         requestURL='https://api.twitter.com/oauth/request_token',
                         accessURL='https://api.twitter.com/oauth/access_token',
                         authURL='https://api.twitter.com/oauth/authorize')

## Complete the handshake and enter the pin to allow this R app to access
##   your Twitter application
cred$handshake(cainfo="cacert.pem")

## Save the object cred as twitter authentication.Rdata
##   This needs to be loaded in R and the registerTwitterOAuth function
##   applied to cred      
save(cred, file="twitter authentication.Rdata")