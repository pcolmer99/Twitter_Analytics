# Twitter Analytics

Hi Readers,

My name is Paul Colmer. There are 3 files I have published that will help you to interrogate Twitter:

File 1 - Authenticate correctly with Twitter (Twitter_Analytics_Setup.R)
File 2 - Allow you to search twitter for tweets that match your search criteria (Twitter_Analytics_Import.R).  
File 3 - Same as 2 but using a Shiny App, allowing you to run the function via a web browser (Twitter_Analytics_App.R).

Twitter_Analytics_Setup.R sets up the correct handshake between R and Twitter to allow you to extract data from Twitter.  You'll need to follow this article carefully, as there are some manual steps involved:

https://www.credera.com/blog/business-intelligence/twitter-analytics-using-r-part-1-extract-tweets/

Credits:  Sugandha Choudhary & Baiey Adam

All the code cited in this article is contained with the R files I have supplied, and has been updated, corrected as the R libraries have changed.

You will also need to create two separate files containing the relevant keys and tokens. These files are called TwitterSecret.xxx and TwitterSecret2.xxx.  It's very important that you exclude these files from any publish, as it will allow others to use your Twitter account.

Twitter_Analytics_Import.R allows you specify a search string and how many tweets to bring back in the query.  You'll need to edit the following variables in the code to vary the search string criteria and the number of tweets to return:

search.string <- "#MyWorkStyle"

no.of.tweets <- 50

Twitter_Analytics_App.R allows you to specify the search string using an input function, and the number of tweets, using a slider bar.

Enjoy



Paul Colmer

@MusicComposer1

