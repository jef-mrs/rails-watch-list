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
(1...34_615).each do |i|
  url = "https://api.themoviedb.org/3/discover/movie?api_key=1929b97b396ec46850284ac5119048bf&language=en-US&page=#{i}"
  movies_serialized = URI.open(url).read
  movies = JSON.parse(movies_serialized)
  movies['results'].each do |mov|
    movie = Movie.create(title: mov['title'], overview: mov['overview'], rating: mov['vote_average'], poster_url: "https://image.tmdb.org/t/p/w500#{mov['poster_path']}")
    puts "#{movie[:title]} created!"
  end
end
puts 'Finished!'
