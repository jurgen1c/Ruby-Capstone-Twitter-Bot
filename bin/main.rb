require_relative '../lib/scraper.rb'
require_relative '../lib/whistle_bot.rb'

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


