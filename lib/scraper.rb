require 'nokogiri'
require 'open-uri'
require 'pry'

class Scraper


  def get_page

    # html = open("https://bendtrails.org/")
    # doc = Nokogiri::HTML(html)

    doc = Nokogiri::HTML(open("https://bendtrails.org/"))
    
    # doc.css("div.trail_group#g_19").children.css(".trail_row list_awesome").each do |trail|
    # trail = children.css("a").attribute("href").title.text
        
    binding.pry 
    end 
    #end 

  end
  
  Scraper.new.get_page 

  
  # doc.css("div.trail_group#g_19")    collection of trails to iterate over

  # doc.css("div.trail_group#g_19").children.css(".trail_row list_awesome")  not working

  # doc.css("div#trail_list_19").children.css("a").attribute("title").value

   # doc.css("div#trail_list_19").first.css("div.trail_row list_awesome")

  #  doc.css("div#g_19").css("div.trail_name").text

  #  doc.css("div#g_19").css("div.trail_name").first.text

  #  doc.css("div#g_19").css("div.trail_length").text

  #  trail = doc.css("div#g_19").collect {|trail| trail.css("div.trail_name").text}
 
  #  doc.css("div#g_19").css("div.trail_name").text

  #  doc.css("div#g_19").css("a").attribute("title").value 