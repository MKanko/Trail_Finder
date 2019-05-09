# MVC architecture - model view controller, the controller is responsible for business logic or user interactions.

class TrailFinder::CliController

    def call
        welcome
        TrailFinder::Scraper.scrape_trail_list
        
        list_trails
        # list_trails_by_distance 
        list_description 
        menu
        
    end 

    def welcome
        puts "" 
        puts "Welcome to Trail Finder. This app will provide information about available Mountain Biking Trails in the Bend area."
        puts "" 
        
    end 

    def list_trails
        #TrailFinder::Scraper.scrape_trail_list 
        puts "" 
        puts "Bend Trails:"
        puts "---------------"
        puts "" 
        @trails = TrailFinder::Trail.all
        @trails.each.with_index(1) do |trail, index|
            puts "#{index}. #{trail.name}"
            #binding.pry 
        end 
    end

    # def list_trails_by_distance
    #     #binding.pry 
    #     @trails = TrailFinder::Trail.all 
    #     @trails.each.with_index(1) do |trail, index|
    #         if (0..5).include?(trail.length.to_i)  
    #             puts "#{index}. #{trail.name}"
    #         elsif (5..10).include?(trail.length.to_i)
    #             puts "#{index}. #{trail.name}"
    #         elsif (10..25).include?(trail.length.to_i)    
    #             puts "#{index}. #{trail.name}"
    #         end 
    #     end
    # end

    def list_description
          
        #@trails = TrailFinder::Trail.all
        @trails.each do |trail|
            TrailFinder::Scraper.scrape_trail_description(trail) 
            trail.description     
            #binding.pry 
        end 
    end 

    def menu
        puts ""
        puts "Enter the number of the trail you would like to see more information about."
        
               
        input = nil
        while input != "exit"
            puts "" 
            puts "---------------"
            puts ""
            #puts "How far would you line to ride today?"
            #puts ""
            #puts "If you would like a ride under 5 miles, type 'short ride'. If you would like a ride between 5-10 miles, type 'medium ride'. If you would like a ride over 10 miles, type 'long ride' or type 'list trails' to see all trails."
            #puts "Enter the number of the trail you would like to see more information about or type 'list trails' to see the trail list."
            #puts ""
            #puts "You may type 'exit' at any time to quit."
            #puts ""

            input = gets.strip.downcase

            # if input == "short ride"
            #     list_trails_by_distance
            #     puts "Enter the number of the trail you would like to see more information about or type 'list trails' to see the trail list."
            # elsif input == "medium ride"
            #     list_trails_by_distance
            #     puts "Enter the number of the trail you would like to see more information about or type 'list trails' to see the trail list."
            # elsif input == "long ride"
            #     list_trails_by_distance
            #     puts "Enter the number of the trail you would like to see more information about or type 'list trails' to see the trail list."
            
            if input.to_i > 0 && input.to_i <= 16 
                trail = @trails[input.to_i-1] 
                puts "" 
                puts "#{trail.name} - Trail Condition: #{trail.condition} - Trail Length: #{trail.length} - Trail Elevation: #{trail.elevation}"
                puts ""
                puts "Selection options:"
                puts "" 
                puts "If you would like to see a detailed description of this trail, type 'description'."
                puts ""  
                puts "If you would like to see information about another trail enter the number of that trail."
                puts ""
                puts "If you would like to view all available trails again, type 'list trails'."
                puts ""
                puts "If your search is complete, type 'exit' to quit." 
            elsif input == "description"
                puts ""
                puts "#{trail.name}:" 
                puts ""
                puts "#{trail.description}"      
            elsif input == "list trails"
                list_trails
            elsif input == "exit"
                puts ""
                goodbye 
            else
                puts "" 
                puts "Invalid selection, please choose an available selection option." 
            
            end 
        end 
    end
    
    def goodbye
        puts "Thank you for using Trail Finder, have a great ride! Goodbye."
        puts "" 
    end 
end 
 


        

# module ArtistsCliFinder
#     class CLI

#         def self.call
#             puts "Welcome to my sweet app."
#             puts "Please search for an artist."
#             input = gets.strip
#             while input != exit
#                 artist = ArtistsCliFinder::ApiRequest.request_artist_data(input)
#                 puts "---"
#                 puts artist.name
#                 puts artist.bio

#                 puts "Would you like to see top songs by this artist. Type y for yes or n for no"
#                 input = gets.strip.downcase
#                 if input == "y"
#                     ArtistCliFinder::ApiRequest.request_top_songs(artist)

#                     puts "Please search for a new artist or type exit"
#                     input = gets.strip
#                 else
#                     puts "Please search for a new artist or type exit"
#                     input = gets.strip 

#                 end 
#             end
#         end

#         def self.print_songs(artist)
#             artist.top_songs.map do |song|
#                 puts songs.name + " on " + song.album

#             end 
#         end 
#     end 
# end 
