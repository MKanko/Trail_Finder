# MVC architecture - model view controller, the controller is responsible for business logic or user interactions.

class TrailFinder::CliController

    def call
        welcome
        TrailFinder::Scraper.scrape_trail_list  
        list_trails
        menu
        goodbye
    end 

    def welcome
        puts "Welcome to Trail Finder. This app will provide information about available Mountain Biking Trails in the Bend area."
        puts "---------------"
    end 

    def list_trails
        @trails = TrailFinder::Trail.all
        binding.pry 
        puts "---------------" 
        puts "Bend Trails:"
        puts "---------------"
        puts "1. Arnold Ice Cave, 2. Boyd Cave Trail, 3. Coyote Loop."
        puts "---------------"
        
         
    end 

    def menu
        input = nil
        while input != "exit"
            puts "Enter the number of the trail you would like to see more information about, or type 'list trails' to view trails, or type 'exit'."
            puts "---------------"
            input = gets.strip.downcase

            case input
            when "1"
                puts "This trail is Awesome! - condition, length, and elevation"
                puts "---------------" 
            when "2"
                puts "This trail Rocks! - condition, length, elevation"
                puts "---------------"
            when "3"
                puts "This trail is Rad! - condition, length, elevation"
                puts "---------------"
            when "list trails" 
                list_trails
            else 
                puts "Invalid selection." 
                puts "---------------"  
            end 
        end 
    end
    
    def goodbye
        puts "Thank you for using Trail Finder, have a great ride! Goodbye."
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
