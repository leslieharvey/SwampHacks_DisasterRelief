# Twitter search for hash-tags
import tweepy
from tweepy import OAuthHandler, Stream, StreamListener

# Twitter Credentials
ACCESS_TOKEN = "1223485018816692224-GaYyuwspGUq8mWPVNInYyVTYCbmiZ9"
ACCESS_SECRET = "bZ1wtD4JAvw8jX2VOHPuHbEzMdETg2LG2xiGCbZkD6DIq"
CONSUMER_KEY = "cbzUSbqNfkiEtWNIorVKtl3uj"
CONSUMER_SECRET = "FAagrzj92MvVBZ2adsnM57Uad9d3S2YDGThAROx0E72kFunnEa"

# Tweepy access
auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_TOKEN, ACCESS_SECRET)
api = tweepy.API(auth)


class StdOutListener(StreamListener):
    def on_data(self, data):
        beg = data.find('"screen_name\":"')
        last = data.find('","', beg)
        temp = data[beg:last]
        final_pos = temp.rindex('":"') + 3
        final_temp = temp[final_pos:len(temp)]
        print(final_temp)
        return True

    def on_error(self, status):
        print(status)


if __name__ == '__main__':
    l = StdOutListener()
    auth = OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
    auth.set_access_token(ACCESS_TOKEN, ACCESS_SECRET)
    stream = Stream(auth, l)
    stream.filter(track=["#power2get"])
