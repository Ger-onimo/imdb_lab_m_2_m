require('pry')
require_relative('models/casting')
require_relative('models/movie')
require_relative('models/star')

Casting.delete_all()
Movie.delete_all
Star.delete_all

movie1 = Movie.new( {'title' => 'Apocalypse Now', 'genre' => 'action'})
movie1.save
movie2 = Movie.new( {'title' => 'The Departed', 'genre' => 'action'})
movie2.save
movie3 = Movie.new( {'title' => 'Some Like It Hot', 'genre' => 'comedy'})
movie3.save
movie4 = Movie.new( {'title' => 'Star Wars', 'genre' => 'sci-fi'})
movie4.save
movie5 = Movie.new( {'title' => 'Grumpy Old Men', 'genre' => 'comedy'})
movie5.save


star1 = Star.new( {'first_name' => 'Martin', 'last_name' => 'Sheen'})
star1.save
star2 = Star.new( {'first_name' => 'Marlon', 'last_name' => 'Brando'})
star2.save
star3 = Star.new( {'first_name' => 'Jack', 'last_name' => 'Lemon'})
star3.save
star4 = Star.new( {'first_name' => 'Julia', 'last_name' => 'Roberts'})
star4.save

casting1 = Casting.new({'movie_id' => movie1.id, 'star_id' => star1.id})
casting1.save
casting2 = Casting.new({'movie_id' => movie1.id, 'star_id' => star2.id})
casting2.save
casting3 = Casting.new({'movie_id' => movie3.id, 'star_id' => star3.id})
casting3.save
casting3 = Casting.new({'movie_id' => movie5.id, 'star_id' => star3.id})
casting3.save


# Casting.all
# Movie.all
# Star.all

binding.pry
nil
