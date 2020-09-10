require_relative '../lib/scraper.rb'

describe Scraper do
  tester = Scraper.new('https://www.inec.cr/', '.indicador-299', 'h2', 'h5', '.indice-general')
  nester = Scraper.new('https://www.worldometers.info/coronavirus/country/costa-rica/',
                       '.content-inner', '[id="maincounter-wrap"]', '[id="maincounter-wrap"]',
                       '[id="maincounter-wrap"]')

  context '#initialize' do
    it 'Creates new scraper object url' do
      expect(tester.url).to eql('https://www.inec.cr/')
    end
    it 'Creates new scraper object target' do
      expect(tester.target).to eql('.indicador-299')
    end
    it 'Creates new scraper object t_loc' do
      expect(tester.t_loc).to eql('h2')
    end
    it 'Creates new scraper object sub_loc' do
      expect(tester.sub_loc).to eql('h5')
    end
    it 'Creates new scraper object d_loc' do
      expect(tester.d_loc).to eql('.indice-general')
    end
  end

  context '#work' do
    it 'Finds relevent unemployment data from site' do
      expect(tester.work).to include("TDA Tasa de Desempleo Abierto\n II Trimestre 2020\n 24,01 Tasa")
    end
  end
  context '#health' do
    it 'Finds relevant covid data from site' do
      expect(nester.health).to include('Coronavirus Cases:')
    end
  end
end
