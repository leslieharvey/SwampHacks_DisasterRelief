# Twitter search for hash-tags
from twython import Twython

# Gather Credentials
credentials = {}
credentials["consumer_key"] = "7NTFSTNtTxGA76ODLqGIRHCpZ"
credentials["consumer_secret"] = "7ShuK7g0KtvKlVEECyMAY5E9k5cdNRYTGHb64FAtr9eNzzc5Nf"
credentials["access_token"] = "1223485018816692224-g6hB4YGbBsBx6p2Yyy2p6pFFiOqgab"
credentials["access_secret"] = "vBI3EEdxbRFUpqJ7Stxe7O5kcSp6KyGCmdaASmxa00dzW"
# def search_twitter(search, login) :

t = Twython(app_key=credentials["consumer_key"],
            app_secret=credentials["consumer_secret"],
            oauth_token=credentials["access_token"],
            oauth_token_secret=credentials["access_secret"]
            )

query = {'q': '#code',
         'count': 10,
         'lang': 'en'
         }

dict_tweets = {}
search = t.search(**query)['statuses']
x = 0
for status in search:
    x = x + 1
    dict_tweets[str(x)] = {'user': status['user']['screen_name'],
                           'date': status['created_at'],
                           'text': status['text']
                           }

z = 0
for tweet in dict_tweets:
    z = z + 1
    print(dict_tweets[str(z)]['user'])
    print(dict_tweets[str(z)]['date'])
    print("\n")
