require 'rubygems'
require 'chatterbot/dsl'

election = Date.new(2022,02,22)
date = Date.today
countdown = election - date

r_users = ['presidenciacr', 'asambleacr', 'CCSSdeCostaRica', 'TSECostaRica', 'CarlosAlvQ', 'msaludcr', 
'ClaudiaDobles', 'paolavegar', 'pacasamblea', 'kike_sanchez', 'lguido', 'AndreaMeza76', 'NielsenPerez', 
'wagnerjimenez1', 'DiputadosPLN', 'jlfonsecaf', 'mariajocc14', 'zoilarosavolio', 'karinenino', 
'epsycampbell', 'leogarnier', 'josemvillalta', 'CaroHHe', 'HaciendaCR', 'MEIC_crc', 'GobDigitalCR', 'MTSS_CR', 'gobiernocr', '']

reckoning = Scraper.new()
reckoning_1 = Scraper.new()

loop do
  i = 0
  for i in r_users do 
    tweet "#{tweet_user(i)} Les quedan #{countdown} días para arreglar el país\n #{reckoning}"
    search(i).take(10).each do |tweet|
      reply "@#{tweet_user(tweet)} #{reckoning}", tweet
    end
  end
  sleep 604800
end

