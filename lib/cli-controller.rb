



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
