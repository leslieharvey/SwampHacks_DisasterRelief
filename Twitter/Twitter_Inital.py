# DM user after they use our hash tag
import time

import tweepy
# Twitter Credentials
ACCESS_TOKEN = "1223485018816692224-GaYyuwspGUq8mWPVNInYyVTYCbmiZ9"
ACCESS_SECRET = "bZ1wtD4JAvw8jX2VOHPuHbEzMdETg2LG2xiGCbZkD6DIq"
CONSUMER_KEY = "cbzUSbqNfkiEtWNIorVKtl3uj"
CONSUMER_SECRET = "FAagrzj92MvVBZ2adsnM57Uad9d3S2YDGThAROx0E72kFunnEa"

auth = tweepy.OAuthHandler(CONSUMER_KEY, CONSUMER_SECRET)
auth.set_access_token(ACCESS_TOKEN, ACCESS_SECRET)
api = tweepy.API(auth)

api.send_direct_message(1054197561463058434, "Hey! We are sorry to hear that you're in danger but luckily we are here to help. "
                                             "What are you experiencing right now?\n1) Heavy Storm\n2) Flood\n"
                                             "3) Hurricane\n4) Fire\n5) Tornado")

messages = api.list_direct_messages()


