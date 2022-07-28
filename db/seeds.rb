require 'json'
require 'open-uri'

puts 'Cleaning database...'
Movie.destroy_all

puts 'Creating movies...'
url = "https://tmdb.lewagon.com/movie/top_rated"
movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)

movies['results'][0..99].each do |movie|
  mov = Movie.create!(title: movie['title'], overview: movie['overview'], rating: movie['vote_average'], poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}")
  puts "#{mov[:title]} created!"
end

puts 'second creation'
movies_id = (5..2000).to_a
movies_id.each do |id|
  url = "https://api.themoviedb.org/3/movie/#{id}?api_key=1929b97b396ec46850284ac5119048bf&language=en-US"
  movie_serialized = URI.open(url).read
  movie = JSON.parse(movie_serialized)
  Movie.create!(title: movie['title'], overview: movie['overview'], rating: movie['vote_average'], poster_url: "https://image.tmdb.org/t/p/w500#{movie['poster_path']}")
  puts "#{movie[:title]} created!"
end
puts 'Finished!'
