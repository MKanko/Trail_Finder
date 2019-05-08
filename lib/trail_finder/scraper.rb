# require 'nokogiri'
# require 'open-uri'
# require 'pry'

class TrailFinder::Scraper 

  def self.scrape_trail_list

      # html = open("https://bendtrails.org/")
      # doc = Nokogiri::HTML(html)

      doc = Nokogiri::HTML(open("https://bendtrails.org/"))

          doc.css("div#trail_list_19").css("div.trail_row").each do |awesome|
              trail_name = awesome.css("div.trail_name").text 
              condition = awesome.css("div.trail_status").text 
              length = awesome.css("div.trail_length").text.gsub(/miles/, "")
              elevation = awesome.css("div.trail_elevation").text.gsub(/elevation/, "") 
              trail_url = awesome.css("div.trail_name a").attr("href").value if trail_name != "Trail Name"

              TrailFinder::Trail.new(trail_name, condition, length, elevation, trail_url) if trail_name != "Trail Name" 
              #binding.pry  
          end 
  end

  #trail_collection = {:trail => trail_name, :status => condition, :distance => length, :elevation => elevation, :trail_url => trail_url}
  #Trail.new_from_collection(trail_collection)
  #Scraper.scrape_trail_list

  def self.scrape_trail_description(trail)  
      doc = Nokogiri::HTML(open(trail.url))
      trail.description = doc.css("div#trail_post_content").css("div.trail_description p").text.gsub(/\n/, "")  
    #binding.pry 
  end 
end

#fake_trail = {"url": "https://bendtrails.org/trail/arnold-ice-cave/"}
#TrailFinder::Scraper.scrape_trail_description(Trail.all[0]) 
  

  # doc.css("div#trail_list_view").css("div.trail_group").css("h3.toggle").text         # css selectors for regions data

  # doc.css("div#trail_list_19").css("div.trail_row")                                   # css selectors fort collection of trails data to iterate over

  # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_name").text        # css selectors for trail_name data

  # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_status").text      # css selectors for trail_condition data

  # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_length").text      # css selectors for trail_length data

  # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_elevation").text   # css selectors for trail_elevation data

  # doc.css("div#trail_list_19").css("div.trail_row.list_awesome").css("div.trail_name a").attribute("href").value   # For trail_url

  # doc.css("div#trail_post_content").css("div.trail_description p").text.gsub(/\n/, "") # css selectors for trail description


  #trail_list = []
        #trail_collection = []

        # doc.css("div#trail_list_19").css("div.trail_row.list_awesome").each do |trail_row| 
        #   trail_name = trail_row.css("div.trail_name").text 
        #   trail_list << trail_name
        # end


#     ("div#trail_list_view").css
# doc.css("div#trail_index").children.css("div.trail_group").each do |trail_group|    # This returns the first region name only, 
# region = trail_group.css("h3.toggle").text                                          # will not iterate because of JS "toggle" 
                                                                                      # event listener 

  
  # trail_url = trail_row.css("div.trail_rating").first.css("a").attribute("href").value
  # skill_level = trail_row.css("div.trail_rating").text

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