# MVC architecture - model view controller, the controller is responsible for business logic or user interactions.

class TrailFinder::CliController

    def call
        welcome
        TrailFinder::Scraper.scrape_trail_list
        list_trails
        menu
    end 

    def welcome
        puts "" 
        puts "Welcome to Trail Finder. This app will provide information about available Mountain Biking Trails in the Bend area.
You have the option of selecting trails from a list based on how far you would like to ride, or selecting trails from a list of all
available trails in the Bend area. All selection commands are available at any time. Follow the prompts and have fun!".light_blue      
        puts ""
        
    end 

    def list_trails
        puts "" 
        puts "Bend Trails:".light_blue 
        puts "---------------"
        @trails = TrailFinder::Trail.all
        @trails.each.with_index(1) do |trail, index|
            puts "#{index}. #{trail.name}".green 
        end
        puts "---------------"   
    end

    def list_short_trails 
        @trails = TrailFinder::Trail.all 
        @trails.each.with_index(1) do |trail, index| 
            if (0..5).include?(trail.length.to_i)    
                puts "#{index}. #{trail.name}".green
            end 
        end
    end 

    def list_medium_trails
        @trails = TrailFinder::Trail.all 
        @trails.each.with_index(1) do |trail, index|
            if (5..10).include?(trail.length.to_i) 
                puts "#{index}. #{trail.name}".green
            end 
        end 
    end 

    def list_long_trails
        @trails = TrailFinder::Trail.all 
        @trails.each.with_index(1) do |trail, index|
            if (10..31).include?(trail.length.to_i)          
                puts "#{index}. #{trail.name}".green
            end 
        end
    end

    def menu
        puts ""
        puts ""
        puts "How far would you like to ride today?".light_blue 
        puts "---------------"
        puts "Type 'short ride' if you would like to ride 5 miles or less.".yellow
        puts ""
        puts "Type 'medium ride' if you like to ride between 5 and 10 miles.".yellow
        puts ""
        puts "Type 'long ride' if you would like to ride over 10 miles.".yellow
        puts ""
        puts "You may also enter the number of any of the trails listed to see information about that trail.".yellow
        puts "---------------" 
        puts ""

        input = nil  

        while input != "exit"

            input = gets.strip.downcase 

            if input == "short ride"
                puts ""
                puts "Trails under 5 miles.".light_blue 
                puts "---------------"
                list_short_trails
                puts "---------------" 
                puts ""
                puts "Enter the number of the trail you would like to see more information about.".light_blue 
                puts ""

            elsif input == "medium ride"
                puts ""
                puts "Trails between 5-10 miles.".light_blue
                puts "---------------"
                list_medium_trails
                puts "---------------"
                puts ""
                puts "Enter the number of the trail you would like to see more information about.".light_blue 
                puts ""

            elsif input == "long ride"
                puts ""
                puts "Trails over 10 miles.".light_blue
                puts "---------------"
                list_long_trails
                puts "---------------"
                puts ""
                puts "Enter the number of the trail you would like to see more information about.".light_blue
                puts ""

            elsif input.to_i > 0 && input.to_i <= 16 
                trail = @trails[input.to_i-1] 
                TrailFinder::Scraper.scrape_trail_description(trail)
                #binding.pry 
                puts ""
                puts "#{trail.name}".light_blue 
                puts "---------------" 
                puts "Trail Condition: #{trail.condition} - Trail Length: #{trail.length} miles - Trail Elevation: #{trail.elevation}".yellow 
                puts "---------------"
                puts "" 
                puts "If you would like to see a detailed description of this trail, type 'description'.".light_blue
                puts ""
                
            elsif input == "description"
                puts ""
                puts "#{trail.name}:".light_blue 
                puts "---------------"
                puts "#{trail.description}".yellow 
                puts "---------------" 
                puts ""
                puts "" 
                puts "You may make another selection from the available options:".light_blue 
                puts "---------------"
                puts "Select how far you would like to ride by typing 'short ride', 'medium ride', or 'long ride'.".yellow
                puts ""
                puts "View all available trails by typing 'list trails'.".yellow
                puts ""
                puts "If you have all the information you need, you may type 'exit' to quit.".yellow
                puts "---------------"
                puts ""

            elsif input == "list trails" 
                list_trails
                puts ""
                puts ""
                puts "How far would you like to ride today?".light_blue 
                puts "---------------"
                puts "Type 'short ride' if you would like to ride 5 miles or less.".yellow
                puts ""
                puts "Type 'medium ride' if you like to ride between 5 and 10 miles.".yellow
                puts ""
                puts "Type 'long ride' if you would like to ride over 10 miles.".yellow
                puts ""
                puts "You may also enter the number of any of the trails listed to see information about that trail.".yellow
                puts "---------------" 
                puts ""

            elsif input == "exit"
                puts ""
                goodbye

            else
                puts "" 
                puts "Invalid selection, please try again.".red
                puts ""
            end 
        end 
    end
    
    def goodbye
        puts "Thank you for using Trail Finder. Have a great ride! Goodbye.".light_blue 
        puts "" 
    end 
end                



