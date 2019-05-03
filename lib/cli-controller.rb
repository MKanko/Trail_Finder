class CliController

    def call
        puts "Welcome to Trail Finder. This app will help you find great Mountain Biking Trails that match your skill level."
        puts "----------"
        puts "To select beginner skill level, enter '1'."
        puts "To select intermediate skill level, enter '2'."
        puts "To select expert skill level, enter '3'."
        puts "----------"
        puts "Please select a skill level"
        puts "To quit enter 'exit'."

        input = gets.strip

        while input != "exit"
            list_matching_trails 

            puts "For a descrition of the trail you are interested in, enter 'Trail Name'."

            input = gets.strip
            list_trail_description

            puts "For another description of a trail you are interested in, enter 'Trail Name' or enter 'exit' to quit."
            
            input = gets.strip

            if input == "Trail Name"
                list_trail_description
            elsif 
                puts "Thank you for using Trail Finder, have a great ride!"

            end
        end 
    end 


    def list_matching_trails  

    end
    
    def list_trail_description 

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
