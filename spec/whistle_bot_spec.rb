require_relative '../lib/whistle_bot.rb'

describe Whistle_bot do
  bot = Whistle_bot.new
  context '#bot_actions' do
    it 'calls tweet method and tweets' do
      expect(bot.bot_actions('tweet', 'Hello')).to eql('Hello')
    end
  end
end


election = Date.new(2022, 0o2, 22)
date = Date.today
countdown = election - date

r_users = %w[@presidenciacr @asambleacr @CCSSdeCostaRica @TSECostaRica @CarlosAlvQ @msaludcr
             @ClaudiaDobles @paolavegar @pacasamblea @kike_sanchez @lguido @AndreaMeza76
             @NielsenPerez @wagnerjimenez1 @DiputadosPLN @jlfonsecaf @mariajocc14 @zoilarosavolio
             @karinenino @epsycampbell @leogarnier @josemvillalta @CaroHHe @HaciendaCR @MEIC_crc
             @GobDigitalCR @MTSS_CR @gobiernocr]

reckoning = Scraper.new('https://www.inec.cr/', '.indicador-299', 'h2', 'h5', '.indice-general')
reckoning_h = Scraper.new('https://www.worldometers.info/coronavirus/country/costa-rica/', '.content-inner',
                          '[id="maincounter-wrap"]', '[id="maincounter-wrap"]', '[id="maincounter-wrap"]')

                          
if Date.today.cwday == 3
  loop do
    r_users.each do |i|
      tweet "#{tweet_user(i)}\n Un recordatorio amigable les quedan #{countdown.to_s.split('/1')}
      días para arreglar el país\n\n #{reckoning.work}\n #{reckoning_h.health}"
      search(i).take(10).each do |tweet|
        reply "@#{tweet_user(tweet)}\n Un recordatorio amigable les quedan #{countdown.to_s.split('/1')}
        días para arreglar el país\n\n #{reckoning.work}\n #{reckoning_h.health}", tweet
      end
    end
    sleep 604_800
    break if Date.today == election
  end
else
  puts 'Please wait till the end of the week'
end
=end

tester = %w[@giordano_diaz @sandooog]

tester.each do |i|
  #tweet "#{tweet_user(i)}\n Un recordatorio amigable les quedan #{countdown.to_s.split('/1')}
  #días para arreglar el país\n\n #{reckoning.work}\n #{reckoning_h.health}"
end
search("to: sandooog", result_type: "recent").take(2).each do |tweet|
  reply "#USER# hello there",tweet
end

puts reckoning.work

def bot_search(user, arg)
  @client.search(user, arg).take(5).each do |tweet|
    puts tweet.text
  end
end

def bot_actions(method, *arg)
  if method == 'tweet'
    bot_tweet(arg)
  elsif method == 'search'
    bot_search(*arg)
  elsif method == 'reply'
    bot_reply
  else
    raise 'Please choose valid method'
  end
end

def token
  @client.bearer_token
end

def bot_reply
end