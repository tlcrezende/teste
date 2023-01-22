require 'open-uri'
require 'net/http'
require 'nokogiri'

class Scraper

  def start
    url = "https://en.wikipedia.org/wiki/List_of_best-selling_books"
    uri = URI.parse(url)
    response = Net::HTTP.get_response(uri)
    html = response.body
    doc = Nokogiri::HTML(html)
    
    # find tables
    table = doc.xpath("/html/body/div[@id='content']/div[@id='bodyContent']/div[@id='mw-content-text']/div[@class='mw-parser-output']/table")
    table_number = table.count 
    @output_scraper = []
    
    # interact in each table
    (table.count - 1).times do |table_number_i|
      
      # find title and author 
      title = doc.xpath("/html/body/div[@id='content']/div[@id='bodyContent']/div[@id='mw-content-text']/div[@class='mw-parser-output']/table[#{table_number_i}]/tbody/tr/td[1]/i/a/text()")
      author = doc.xpath("/html/body/div[@id='content']/div[@id='bodyContent']/div[@id='mw-content-text']/div[@class='mw-parser-output']/table[#{table_number_i}]/tbody/tr/td[2]/a/text()")
      # genre = doc.xpath("/html/body/div[@id='content']/div[@id='bodyContent']/div[@id='mw-content-text']/div[@class='mw-parser-output']/table[#{table_number_i}]/tbody/tr/td[6]/a/text()")
      
      # save books
      (title.count).times do |book_number_i|
        title_book = (title[book_number_i].text || "none") unless title[book_number_i].nil?
        author_book = (author[book_number_i].text || "none") unless author[book_number_i].nil?
        @output_scraper << {
          :title => title_book,
          :author => author_book
        }
      end
  
      p "Adding Table #{table_number_i} ..."
    end
  end

  def output
    @output_scraper
  end

end



