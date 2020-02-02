const { Autohook} = require('twitter-autohook');
const util = require('util');
const request = require('request');

const post = util.promisify(request.post);

process.env['TWITTER_CONSUMER_KEY'] = "cbzUSbqNfkiEtWNIorVKtl3uj";
process.env['TWITTER_CONSUMER_SECRET'] = "FAagrzj92MvVBZ2adsnM57Uad9d3S2YDGThAROx0E72kFunnEa";
process.env['TWITTER_ACCESS_TOKEN'] = "1223485018816692224-GaYyuwspGUq8mWPVNInYyVTYCbmiZ9";
process.env['TWITTER_ACCESS_TOKEN_SECRET'] = "bZ1wtD4JAvw8jX2VOHPuHbEzMdETg2LG2xiGCbZkD6DIq";
process.env['TWITTER_WEBHOOK_ENV'] = 'env';

const oAuthConfig = {
    token: process.env.TWITTER_ACCESS_TOKEN,
    token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET,
    consumer_key: process.env.TWITTER_CONSUMER_KEY,
    consumer_secret: process.env.TWITTER_CONSUMER_SECRET,
};

async function initalMessage(receiver) {

    //const message = message_create.direct_message_events.shift();
    //await indicateTyping(message.message_create.sender_id, oAuthConfig);
    const requestConfig = {
        url: 'https://api.twitter.com/1.1/direct_messages/events/new.json',
        oauth: oAuthConfig,
        json: {
            event: {
                type: 'message_create',
                message_create: {
                    target: {
                        recipient_id: receiver,
                    },
                    message_data: {
                        text: "What are you experiencing?\n1) Fire\n2) Tornado\n3) Flood\n4) Heavy Storm\n5) Hurricane",
                    },
                },
            },
        },
    };
    await post(requestConfig);
}
async function markAsRead(messageId, senderId, auth) {
    const requestConfig = {
        url: 'https://api.twitter.com/1.1/direct_messages/mark_read.json',
        form: {
            last_read_event_id: messageId,
            recipient_id: senderId,
        },
        oauth: auth,
    };

    await post(requestConfig);
}

async function indicateTyping(senderId, auth) {
    const requestConfig = {
        url: 'https://api.twitter.com/1.1/direct_messages/indicate_typing.json',
        form: {
            recipient_id: senderId,
        },
        oauth: auth,
    };

    await post(requestConfig);
}

function sleep(ms){
    return new Promise(resolve=>{
        setTimeout(resolve,ms)
    })
}

(async start => {
    try {
        const webhook = new Autohook();
        await webhook.removeWebhooks();
        await webhook.start();

        await initalMessage(1054197561463058434);

        await webhook.subscribe({oauth_token: process.env.TWITTER_ACCESS_TOKEN, oauth_token_secret: process.env.TWITTER_ACCESS_TOKEN_SECRET});
    } catch (e) {
        console.error(e);
        if (e.name === 'RateLimitError') {
            await sleep(e.resetAt - new Date().getTime());
            process.exit(1);
        }
    }
})();
