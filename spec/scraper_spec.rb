
 @title = indicador.css('h2').inner_text
 @subtitle = indicador.css('h5').first.inner_text
 @data = indicador.css('.datos').css('.indice-general').first.inner_text
 @graphic = indicador.css('.canvas-299-mini')
 @src = indicador.css('figure').css('.fuente').inner_text

 indicador = { 
        @subtitle => indicador.css('h5').first.inner_text,
        @data => indicador.css('.datos').css('.indice-general').first.inner_text,
        @graphic =>indicador.css('.canvas-299-mini'),
        @src => indicador.css('figure').css('.fuente').inner_text 
      }

      def health
        @url = 'www.'
        
        doc = URI.open(@url)
        content = doc.read
        parsed_content = Nokogiri::HTML(content)
      end