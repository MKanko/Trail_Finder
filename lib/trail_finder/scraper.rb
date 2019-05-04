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

            #("div#trail_list_view").css
      # doc.css("div#trail_index").children.css("div.trail_group").each do |trail_group|    # This returns the first region name only, 
      #   region = trail_group.css("h3.toggle").text                                        # will not iterate because of JS toggle 
                                                                                            # event listener 
        # trail_list = []
        # trail_collection = []

        # doc.css("div#trail_list_19").css("div.trail_row").each do |trail_row| 
        #   trail_name = trail_row.css("div.trail_name").text 
        #   trail_list << trail_name
        # end

        doc.css("div#trail_list_19").css("div.trail_row").each do |trail_row|
          trail_name = trail_row.css("div.trail_name").text
          trail_url = trail_row.css("div.trail_name a").attribute("href").value
          binding.pry 
          condition = trail_row.css("div.trail_status").text 
          length = trail_row.css("div.trail_length").text
          elevation = trail_row.css("div.trail_elevation").text
          # trail_hash = {:trail => trail_name, :status => condition, :distance => length, :elevation => elevation}
          # trail_collection << trail_hash  
          # Trail.new(trail_name, condition, length, elevation) if trail_name != "Trail Name"
          #binding.pry 
        end
      #end 
        # trail_list.shift 
        # trails = trail_collection.shift 
        # Trail.new_from_collection(trails)
        # binding.pry 
    end 
  end
  
  Scraper.scrape_trail_list

  def self.scrape_trail_rating

    @@browser.goto 'https://bendtrails.org/'

    ratings = @@browser.divs(class: 'trail_row')
    ratings.each do |rating|
      skill_level = rating.divs(class: 'trail_rating').text
      #binding.pry  
    end 
  end
  
  #Scraper.scrape_trail_rating
  
  # .css("div.trail_group").css("h3.toggle").text                                       # This returns all the region names in one string
  # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_name").text        # Same as above only with trail names


  # doc.css("div#trail_list_view").css("div.trail_group").css("h3.toggle").text         # css selectors for regions data

  # doc.css("div#trail_list_19").css("div.trail_row")                                   # css selectors fort collection of trails data to iterate over

  # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_name").text        # css selectors for trail_name data

  # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_status").text      # css selectors for trail_condition data

  # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_length").text      # css selectors for trail_length data

  # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_elevation").text   # css selectors for trail_elevation data

  

  
  # trail_url = trail_row.css("div.trail_rating").first.css("a").attribute("href").value
  #skill_level = trail_row.css("div.trail_rating").text

  #copybara
  #watir
  #https://github.com/sparklemotion/nokogiri/wiki/Cheat-sheet

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


  

  #  doc.css("div#g_19").css("a").attribute("title").value

  # def scrape_trail_page(trail)
  #   doc = Nokogiri.open(traIL.URL)
  #   trail.description = doc.css(p)
  # end 