require 'open-uri'
require 'nokogiri'

class Scraper
  attr_reader :url, :doc, :content, :parsed_content, :target
  def initialize(url, target)
    @url = url
    @target = target
    
    @doc = URI.open(url)
    @content = doc.read
    @parsed_content = Nokogiri::HTML(content)
    
  end

  def find_work
    @parsed_content.css(@target).inner_text
  end

  def find_health
    @parsed_content.css('')
  end

end





