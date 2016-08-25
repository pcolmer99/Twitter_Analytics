# Twitter Analytics

Hi Readers,

My name is Paul Colmer. The two files here are written to help you authenticate correctly with Twitter and then allow you to search twitter for tweets that match your search criteria.

Twitter_Analytics_Setup.R sets up the correct handshake between R and Twitter to allow you to extract data from Twitter.  You'll need to follow this article carefully, as there are some manual steps involved:

https://www.credera.com/blog/business-intelligence/twitter-analytics-using-r-part-1-extract-tweets/

Credits:  Sugandha Choudhary & Baiey Adam

All the code cited in this article is contained with the R files I have supplied, and has been updated, corrected as the R libraries have changed.

Twitter_Analytics_Import.R allows you specify a search string and how many tweets to bring back in the query.  You'll need to edit the following variables in the code to vary the search string criteria and the number of tweets to return:

search.string <- "#MyWorkStyle"

no.of.tweets <- 50

Enjoy



Paul Colmer

@MusicComposer1

