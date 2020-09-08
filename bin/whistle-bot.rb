require 'rubygems'
require 'chatterbot/dsl'
require_relative '../lib/scraper.rb'

election = Date.new(2022,02,22)
date = Date.today
countdown = election - date

r_users = ['presidenciacr', 'asambleacr', 'CCSSdeCostaRica', 'TSECostaRica', 'CarlosAlvQ', 'msaludcr', 
'ClaudiaDobles', 'paolavegar', 'pacasamblea', 'kike_sanchez', 'lguido', 'AndreaMeza76', 'NielsenPerez', 
'wagnerjimenez1', 'DiputadosPLN', 'jlfonsecaf', 'mariajocc14', 'zoilarosavolio', 'karinenino', 
'epsycampbell', 'leogarnier', 'josemvillalta', 'CaroHHe', 'HaciendaCR', 'MEIC_crc', 'GobDigitalCR', 'MTSS_CR', 'gobiernocr', '']

reckoning = Scraper.new('https://www.inec.cr/', '.indicador-299')

puts reckoning.find_work
puts countdown

tweet "#{tweet_user('sandooog')} this is another test"


=begin
  loop do
    for i in r_users do 
      tweet "#{tweet_user(i)} Les quedan #{countdown.split('/')} días para arreglar el país\n #{reckoning.title}"
      search(i).take(10).each do |tweet|
        reply "@#{tweet_user(tweet)} #{reckoning}", tweet
      end
    end
    sleep 604800
  end
=end
