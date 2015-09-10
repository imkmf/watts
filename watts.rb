require 'pry'
require 'dotenv'
Dotenv.load

require 'twitter'

WHITELIST=nil

# if you want to save multiple tweets
# WHITELIST=[123,456,789]

module Watts
  class Client
    def purge
      whitelist = WHITELIST || ENV["WHITELIST_TWEET"]
      tweets = get_all_tweets('imkmf')
      tweets.each do |t|
        whitelisted = if whitelist.is_a?(Array)
          whitelist.include?(t.id)
        elsif whitelist == t.id
          true
        end

        twitter.destroy_status(t.id) unless whitelisted
      end
    end

    def twitter
      @_twitter ||= Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
        config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
        config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
        config.access_token_secret = ENV["TWITTER_ACCESS_SECRET"]
      end
    end

    def collect_with_max_id(collection=[], max_id=nil, &block)
      response = yield(max_id)
      collection += response
      response.empty? ? collection.flatten : collect_with_max_id(collection, response.last.id - 1, &block)
    end

    def get_all_tweets(user)
      collect_with_max_id do |max_id|
        options = {count: 200, include_rts: true}
        options[:max_id] = max_id unless max_id.nil?
        twitter.user_timeline(user, options)
      end
    end
  end
end

Watts::Client.new.purge
