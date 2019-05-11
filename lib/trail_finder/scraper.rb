class TrailFinder::Scraper 

  def self.scrape_trail_list

    doc = Nokogiri::HTML(open("https://bendtrails.org/"))

      doc.css("div#trail_list_19").css("div.trail_row").each do |awesome|
          trail_name = awesome.css("div.trail_name").text 
          condition = awesome.css("div.trail_status").text 
          length = awesome.css("div.trail_length").text.gsub(/[~ miles]/, "") 
          elevation = awesome.css("div.trail_elevation").text.gsub(/elevation/, "") 
          trail_url = awesome.css("div.trail_name a").attr("href").value if trail_name != "Trail Name"

          TrailFinder::Trail.new(trail_name, condition, length, elevation, trail_url) if trail_name != "Trail Name"   
        end 
  end

  def self.scrape_trail_description(trail)  
      doc = Nokogiri::HTML(open(trail.url))
      trail.description = doc.css("div#trail_post_content").css("div.trail_description p").text.gsub(/\n/, "")   
  end

end


  

  # doc.css("div#trail_list_view").css("div.trail_group").css("h3.toggle").text         # css selectors for regions data

  # doc.css("div#trail_list_19").css("div.trail_row")                                   # css selectors fort collection of trails data to iterate over

  # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_name").text        # css selectors for trail_name data

  # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_status").text      # css selectors for trail_condition data

  # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_length").text      # css selectors for trail_length data

  # doc.css("div#trail_list_19").css("div.trail_row").css("div.trail_elevation").text   # css selectors for trail_elevation data

  # doc.css("div#trail_list_19").css("div.trail_row.list_awesome").css("div.trail_name a").attribute("href").value   # For trail_url

  # doc.css("div#trail_post_content").css("div.trail_description p").text.gsub(/\n/, "") # css selectors for trail description


 