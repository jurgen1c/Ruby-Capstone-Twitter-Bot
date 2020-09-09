require 'rubygems'
require 'chatterbot/dsl'
require_relative '../lib/scraper.rb'


election = Date.new(2022, 0o2, 22)
date = Date.today
countdown = election - date

r_users = %w[presidenciacr asambleacr CCSSdeCostaRica TSECostaRica CarlosAlvQ msaludcr
             ClaudiaDobles paolavegar pacasamblea kike_sanchez lguido AndreaMeza76
             NielsenPerez wagnerjimenez1 DiputadosPLN jlfonsecaf mariajocc14 zoilarosavolio
             karinenino epsycampbell leogarnier josemvillalta CaroHHe HaciendaCR MEIC_crc
             GobDigitalCR MTSS_CR gobiernocr]

reckoning = Scraper.new('https://www.inec.cr/', '.indicador-299', 'h2', 'h5', '.indice-general')
reckoning_h = Scraper.new('https://www.worldometers.info/coronavirus/country/costa-rica/', '.content-inner',
                          '[id="maincounter-wrap"]', '[id="maincounter-wrap"]', '[id="maincounter-wrap"]')

if Date.today.cwday == 5
  loop do
    r_users.each do |i|
      tweet "#{tweet_user(i)}\n Un recordatorio amigable les quedan #{countdown.to_s.split('/1')}
      días para arreglar el país\n\n #{reckoning.find_work}\n #{reckoning_h.find_health}"
      search(i).take(10).each do |tweet|
        reply "@#{tweet_user(tweet)} #{reckoning}", tweet
      end
    end
    sleep 604_800
    break if Date.today == election
  end
else
  puts 'Please wait till the end of the week'
end

