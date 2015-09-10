Watts is a hastily put-together project as an experiment in Twitter temporality.

Maybe archive your Tweets first.

Watts destroys all your tweets, with the exception of those you whitelist (and I suggest that it's just one, so people know why your timeline is so bare).

Make sure you have a `.env` file that looks like:

```
WHITELIST_TWEET="1234567890"
TWITTER_CONSUMER_KEY="foo"
TWITTER_CONSUMER_SECRET="foo"
TWITTER_ACCESS_TOKEN="foo"
TWITTER_ACCESS_SECRET="foo"
```

Then:

```
bundle install
bundle exec ruby watts.rb
```

This isn't setup to handle rate limits. Once you've run it once, there's a good chance you won't have rate-limit problems again. ;)

> "We are living in a culture entirely hypnotized by the illusion of time, in which the so-called present moment is felt as nothing but an infintesimal hairline between an all-powerfully causative past and an absorbingly important future. We have no present. Our consciousness is almost completely preoccupied with memory and expectation. We do not realize that there never was, is, nor will be any other experience than present experience. We are therefore out of touch with reality. We confuse the world as talked about, described, and measured with the world which actually is. We are sick with a fascination for the useful tools of names and numbers, of symbols, signs, conceptions and ideas."

**- Alan W. Watts**
