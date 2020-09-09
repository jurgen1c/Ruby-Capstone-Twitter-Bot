require 'open-uri'
require 'nokogiri'

class Scraper
  attr_reader :url, :doc, :content, :parsed_content, :target, :title, :subtitle, :data,
              :t_loc, :sub_loc, :d_loc
  def initialize(url, target, t_loc, sub_loc = nil, d_loc = nil)
    @url = url
    @target = target
    @t_loc = t_loc
    @sub_loc = sub_loc
    @d_loc = d_loc

    @doc = URI.open(url)
    @content = doc.read
    @parsed_content = Nokogiri::HTML(content)
  end

  def find_work
    @parsed_content.css(@target).each do |x|
      @title = x.css(@t_loc).first.inner_text
      @subtitle = x.css(@sub_loc).first.inner_text
      @data = x.css(@d_loc).first.inner_text
    end
    "#{@title}\n #{@subtitle}\n #{@data}"
  end

  def find_health
    @parsed_content.css(@target).each do |x|
      @title = x.css(@t_loc)[0].inner_text
      @subtitle = x.css(@sub_loc)[1].inner_text
    end
    "#{@title}\n #{@subtitle}"
  end
end
