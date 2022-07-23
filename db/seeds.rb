require 'json'
require 'open-uri'

puts 'Cleaning database...'
Movie.destroy_all

puts 'Creating movies...'
url = "https://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)

movies['results'][0..99].each do |movie|
  Movie.create!(title: movie['title'], overview: movie['overview'], rating: movie['vote_average'], poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}")
  puts "#{movie[:title]} created!"
end

puts 'Finished!'
