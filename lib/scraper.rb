require 'open-uri'
require 'nokogiri'

class Scraper
  attr_accessor :url
  public def empleo(url)
    @url = url
    
    doc = URI.open(@url)
    content = doc.read
    parsed_content = Nokogiri::HTML(content)
    
    parsed_content.css('.indicador-299').each do |indicador|
      title = indicador.css('h2').inner_text
      subtitle = indicador.css('h5').inner_text
      data = indicador.css('.datos').css('.indice-general').inner_text
      graphic = indicador.css('figure').css('canvas').inner_html
      src = indicador.css('figure').css('.fuente').inner_text
      
      puts title
      puts subtitle
      puts data
      puts graphic
      puts src
    end
  end

  empleo('https://www.inec.cr/')

end


