require_relative '../lib/whistle_bot.rb'

describe WhistleBot do
  bot = WhistleBot.new
  t_client = Twitter::REST::Client.new do |config|
    config.consumer_key = 'SLun3OyIGUCbdwULhnv5vZ01z'
    config.consumer_secret = 'gD5Q2f6G3QEMX0Ztzutz8JMMDeNIbubEN1DZlUOjZzf1gm6hn6'
    config.access_token = '1062512827368435712-TD5Le3ohqaywC8WLYq5BDZvF2agg66'
    config.access_token_secret = 'zo7lymjImDqZwNSetTfn92UoZzLclmgp8oRjtBcvntpER'
  end

  context '#initialize' do
    it 'Sets client communicatio with Twitter API' do
      expect(bot.client).not_to eql(t_client)
    end
  end
end
