require 'twitter'


class Whistle_bot
  attr_reader :client 
  attr_writer :arg, :user, :method
  def initialize
    @client = Twitter::REST::Client.new do |config|
      config.consumer_key = "SLun3OyIGUCbdwULhnv5vZ01z"
      config.consumer_secret = "gD5Q2f6G3QEMX0Ztzutz8JMMDeNIbubEN1DZlUOjZzf1gm6hn6"
      config.access_token = "1062512827368435712-TD5Le3ohqaywC8WLYq5BDZvF2agg66"
      config.access_token_secret = "zo7lymjImDqZwNSetTfn92UoZzLclmgp8oRjtBcvntpER"
    end
  end

  def bot_actions(method, user = nil, arg)
    @method = method
    @user = user
    @arg = arg
    if @method == 'search'
      bot_search(@user, @arg)
    elsif @method == 'tweet'
      bot_tweet(@arg)
    elsif @method == 'reply'
      bot_reply_tweet()
    else
      raise 'Please input a valid method'
    end
  end

  private

  def bot_search(user, *arg)
    @user = user
    @arg = arg
    @client.search(@user, @arg)
  end
  
  def bot_tweet(*arg)
    @arg = arg
    @client.update(@arg)
  end

  def bot_reply_tweet(user, *arg)
    @user = user
    @arg = arg
    @client.bot_search(@user, @arg).id
  end
end

tester = Whistle_bot.new

tester.bot_actions('search', "from:heyamberwilkie", result_type: "recent").take(5).each do |tweet|
  puts tweet.text
end






