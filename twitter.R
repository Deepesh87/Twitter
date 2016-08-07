install.packages("twitteR")
install.packages("RCurl")
install.packages("plyr")
install.packages("wordcloud")
library(base64enc)
library(twitteR)
library(RCurl)
library(bitops)
library(ROAuth)
library(plyr)
library(devtools)
library(wordcloud)
library(tm)
install.packages("devtools")
devtools::install_github("hadley/httr")
install.packages("ROAuth") 

download.file(url="http://curl.haxx.se/ca/cacert.pem",destfile="cacert.pem")


consumer_key='NKcO1Y7lXnodYZSOf3sFemUgg'
consumer_secret='YOvNiaOYdiqlpkTHqxex1VN6KeGJkhw8zxw71wZETs2abcPmQO'
access_token='246900664-2H0qLbCsXKYBjOqW4mumlyp04WbKwVRXlpK66veL'
access_secret='u37lWM3bxCwnwFuu46RoT0sjn7rA445WYdjEllQCTbDNT'


setup_twitter_oauth(consumer_key,consumer_secret,access_token,access_secret)

# lets pull tweets

tweetList=searchTwitter("#TEAFORTRUMP",n=1000,lang="en",resultType = "recent")
tweets.df = ldply(tweetList, function(t) t$toDataFrame())
write.csv(tweets.df,file="teafortrump.csv")

tweets=read.csv("teafortrump.csv")
str(tweets)
tweetsText=tweets$text
corp=Corpus(VectorSource(tweetsText))
inspect(corp[1])

corp_clean=tm_map(corp,removePunctuation)
corp_clean=tm_map(corp_clean,content_transformer(tolower))
corp_clean=tm_map(corp_clean,removeNumbers)
corp_clean=tm_map(corp_clean,removeWords,stopwords("english"))
corp_clean=tm_map(corp_clean,removeWords,c("trump","drinkthetea","teafortrump"))



#simpleWordcloud
wordcloud(corp_clean)

wordcloud(corp_clean,random.order = F,max.words = 40,scale = c(6,0.5),colors = rainbow(50))





#***********************************************************************


tweets2=read.csv("niceattack.csv")
str(tweets2)
tweets2Text=tweets2$text
corp=Corpus(VectorSource(tweets2Text))
inspect(corp[1])

corp_clean2=tm_map(corp,removePunctuation)
corp_clean2=tm_map(corp_clean2,content_transformer(tolower))
corp_clean2=tm_map(corp_clean2,removeNumbers)
corp_clean2=tm_map(corp_clean2,removeWords,stopwords("english"))
corp_clean2=tm_map(corp_clean2,removeWords,c("nice","terrorism","terrorist","niceattack"))



#simpleWordcloud
wordcloud(corp_clean2)

wordcloud(corp_clean2,random.order = F,max.words = 60,scale = c(6,0.5),colors = rainbow(50))
#****************************************************
#MohenjoDaro
tweet3List=searchTwitter("#MohenjoDaro",n=5000,lang="en",resultType = "recent")
tweets3.df = ldply(tweet3List, function(t) t$toDataFrame())
write.csv(tweets3.df,file="mohenjodaro.csv")


tweets3=read.csv("mohenjodaro.csv")
str(tweets3)
tweets3Text=tweets3$text
corp3=Corpus(VectorSource(tweets3Text))
inspect(corp[1])

corp_clean3=tm_map(corp3,removePunctuation)
corp_clean3=tm_map(corp_clean3,content_transformer(tolower))
corp_clean3=tm_map(corp_clean3,removeNumbers)
corp_clean3=tm_map(corp_clean3,removeWords,stopwords("english"))
corp_clean3=tm_map(corp_clean3,removeWords,c("mohenjodaro","hrithik","pooja"))



#simpleWordcloud
wordcloud(corp_clean3)

wordcloud(corp_clean3,random.order = F,max.words = 40,scale = c(6,0.5),colors = rainbow(50))









