# Twitter search for hash-tags
import tweepy

# Twitter Credentials
ACCESS_TOKEN = "1223485018816692224-g6hB4YGbBsBx6p2Yyy2p6pFFiOqgab"
ACCESS_SECRET = "vBI3EEdxbRFUpqJ7Stxe7O5kcSp6KyGCmdaASmxa00dzW"
CONSUMER_KEY = "7NTFSTNtTxGA76ODLqGIRHCpZ"
CONSUMER_SECRET = "7ShuK7g0KtvKlVEECyMAY5E9k5cdNRYTGHb64FAtr9eNzzc5Nf"

# Tweepy access
auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_TOKEN, ACCESS_SECRET)
api = tweepy.API(auth)


class StreamListener(tweepy.StreamListener):
    def on_status(self, status):
        if status.retweeted_status:
            return
        print(status.text)

    def on_error(self, status_code):
        if status_code == 420:
            return False


stream_listener = StreamListener()
stream = tweepy.Stream(auth=api.auth, listener=stream_listener)
stream.filter(track=["I "])
