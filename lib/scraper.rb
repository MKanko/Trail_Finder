require 'nokogiri'
require 'open-uri'
require 'pry'
require 'webdrivers'
require 'watir'

class Scraper

  #@@browser = Watir::Browser.new(:chrome, headless: true)


  def self.scrape_trail_list

    # html = open("https://bendtrails.org/")
    # doc = Nokogiri::HTML(html)

    doc = Nokogiri::HTML(open("https://bendtrails.org/"))

      doc.css("div#trail_list_19").css("div.trail_row").each do |trail_row|
        #trail = Trail.new
        trail_name = trail_row.css("div.trail_name").text
        condition = trail_row.css("div.trail_status").text
        length = trail_row.css("div.trail_length").text 
        elevation = trail_row.css("div.trail_elevation").text
        binding.pry  
      end

      # Navigate headless browser to desired site

      # @@browser.goto "https://bendtrails.org/"

      # # Get all divs of class "trail_rating"
        
      # ratings = @@browser.divs(class: "trail_rating")

      
      # ratings.each do |rating|

      #   # Get text in the span of class "rating"

      #   skill_level = rating.span(class: "rating").text

      #   # Get the href of the a

      #   url = rating.a.href
      # end 


       
    end 
  end
 

  # trail_url = trail_row.css("div.trail_rating").first.css("a").attribute("href").value
  #skill_level = trail_row.css("div.trail_rating").text

  Scraper.scrape_trail_list
  


  #copybara
  #watir
  #https://github.com/sparklemotion/nokogiri/wiki/Cheat-sheet

  # 

    # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_name").text
    # name =
    # length =
    # skill =
    # url =
        
    
  
   
  
  

  # #trail_list_19 > div:nth-child(3) > div.trail_rating > a > span
  
  # doc.css("div.trail_group#g_19")    

  # doc.css("div.trail_group#g_19").children.css(".trail_row list_awesome")  not working

  # doc.css("div#trail_list_19").children.css("a").attribute("title").value

  # doc.css("div#trail_list_19").first.css("div.trail_row list_awesome")

  #  doc.css("div#g_19").css("div.trail_name").text

  #  doc.css("div#g_19").css("div.trail_name").first.text

  #  doc.css("div#g_19").css("div.trail_length").text

  #  trail = doc.css("div#g_19").collect {|trail| trail.css("div.trail_row").text}
 
  #  doc.css("div#g_19").css("div.trail_name").text.split 

  #  doc.css("div#g_19").css("a").attribute("title").value 

  #  doc.css("div#g_19").css("a").attribute("title").value
  
  #  doc.css("div#trail_list_19").css("div.trail_name").text.split 


  # doc.css("div#trail_list_19").css("div.trail_row")     collection of trails to iterate over
  # doc.css("div#trail_list_19").css("div.trail_row")[0].css("div.trail_name").text

  #  doc.css("div#g_19").css("a").attribute("title").value

  # def scrape_trail_page(trail)
  #   doc = Nokogiri.open(traIL.URL)
  #   trail.description = doc.css(p)
  # end 