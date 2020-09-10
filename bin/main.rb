require 'twitter'
require_relative '../lib/scraper.rb'
require_relative '../lib/whistle_bot.rb'

election = Date.new(2022, 0o2, 22)
date = Date.today
countdown = election - date
bot = WhistleBot.new

r_users = %w[@presidenciacr @asambleacr @CCSSdeCostaRica @TSECostaRica @CarlosAlvQ @msaludcr
             @ClaudiaDobles @paolavegar @pacasamblea @kike_sanchez @lguido @AndreaMeza76
             @NielsenPerez @wagnerjimenez1 @DiputadosPLN @jlfonsecaf @mariajocc14 @zoilarosavolio
             @karinenino @epsycampbell @leogarnier @josemvillalta @CaroHHe @HaciendaCR @MEIC_crc
             @GobDigitalCR @MTSS_CR @gobiernocr]

reckoning = Scraper.new('https://www.inec.cr/', '.indicador-299', 'h2', 'h5', '.indice-general')
reckoning_h = Scraper.new('https://www.worldometers.info/coronavirus/country/costa-rica/', '.content-inner',
                          '[id="maincounter-wrap"]', '[id="maincounter-wrap"]', '[id="maincounter-wrap"]')

tweet_body = "\n Un recordatorio amigable les quedan #{countdown.to_s.split('/1')}
días para arreglar el país\n\n #{reckoning.work}\n #{reckoning_h.health}"

# Bot will only run on fridays to allow enough time to pass for relevant scraper data to update
# and not be blocked for spam

if Date.today.cwday == 5
  loop do
    r_users.each do |i|
      tweet_r = i + tweet_body
      bot.bot_actions('tweet', i, tweet_r)
      bot.bot_actions('search', "from:#{i}", result_type: 'recent').take(10).each do |tweet|
        bot.bot_actions('reply', tweet_r, tweet.id)
        puts tweet.text
      end
    end
    sleep 604_800
    break if Date.today == election
  end
else
  puts 'Please wait till next Friday'
end

# Since the code above will tweet at the president and his cabinet,
# to not spam these accounts and get flagged i have added the test code
# below to prove bot and scraper are working

tester = %w[@giordano_diaz @sandooog]

tester.each do
  bot.bot_actions('search', 'from:HamillHimself', result_type: 'recent').take(2).each do |tweet|
    puts tweet.text
  end
end

puts reckoning.work
puts reckoning_h.health
