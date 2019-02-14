require 'bundler/setup'
Bundler.require
require 'sinatra/reloader' if development?

require 'open-uri'
require 'nokogiri'

get '/' do
  url = 'http://lit.gahaku.tech/old/'
  html = open(url).read
  parsed_html = Nokogiri::HTML.parse(html,nil,'utf-8')
  parsed_html.css('ul.supporter-list').css('li').each do |node|
    anchor = node.css('a')
    logger.info anchor.attribute('href').value.match(/https://web\.archive\.org/web/20170603211131/https?:\/\/(?:www\.)?(?:jp\.)?(?:info\.)?(?:docs\.)?([^\.]*)/)[1]
  end
end
