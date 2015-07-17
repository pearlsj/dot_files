require 'rubygems'
require 'bundler/setup'

# Script dependencies
require 'nokogiri'
require 'open-uri'

#In the news section
url = 'https://www.nextcapital.com/news'
data = Nokogiri::HTML(open(url))
articles = data.css('.item')

articles.each do |article|
  if article.at_css('.day') &&  article.at_css('.month') && article.at_css('.year')
    filename = "news/#{ article.at_css('.day').text }-#{ article.at_css('.month').text }-#{ article.at_css('.year').text }.html"

    File.open(filename, 'w+') do |file|
      file.write(article)
      file.close
    end
  end
end

#Blog
url = 'http://blog.nextcapital.com'
data = Nokogiri::HTML(open(url))
links = []

11.times do
  anchors = data.css('.permalink a')

  anchors.each do |link|
    links.push(link.attribute('href').to_s)
  end

  if data.at_css('.next a')
    next_page = url + data.css('.next a').attribute('href').to_s
    data = Nokogiri::HTML(open(next_page))
  end
end

links.each do |link|
  data = Nokogiri::HTML(open(link))
  entry = data.css('#main')

  link.slice! 'http://blog.nextcapital.com/posts/'
  filename = "entries/#{ link }.html"

  File.open(filename, 'w+') do |file|
    file.write(entry)
    file.close
  end
end
