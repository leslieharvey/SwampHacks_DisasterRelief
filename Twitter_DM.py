# DM user after they use our hash tag

from twython import Twython

# Gather Credentials
credentials = {}
credentials["consumer_key"] = "7NTFSTNtTxGA76ODLqGIRHCpZ"
credentials["consumer_secret"] = "7ShuK7g0KtvKlVEECyMAY5E9k5cdNRYTGHb64FAtr9eNzzc5Nf"
credentials["access_token"] = "1223485018816692224-g6hB4YGbBsBx6p2Yyy2p6pFFiOqgab"
credentials["access_secret"] = "vBI3EEdxbRFUpqJ7Stxe7O5kcSp6KyGCmdaASmxa00dzW"

t = Twython(app_key=credentials["consumer_key"],
            app_secret=credentials["consumer_secret"],
            oauth_token=credentials["access_token"],
            oauth_token_secret=credentials["access_secret"]
            )

t.send_direct_message(user_id="leslie_harvey3", text="testing!")
