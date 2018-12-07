require('pg')
require_relative("../db/sql_runner")
require_relative('movie')
require_relative('star')

class Casting

attr_reader :id
attr_accessor :movie_id, :star_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @movie_id = options['movie_id'].to_i
    @star_id = options['star_id'].to_i
  end

  def save()
    sql = "INSERT INTO castings (movie_id, star_id) VALUES ($1, $2) RETURNING id"
    values = [@movie_id, @star_id]
    casting = SqlRunner.run(sql, values)[0];
    @id = casting['id'].to_i
  end

  def self.all()
    sql = "SELECT * FROM castings"
    data = SqlRunner.run(sql)
    return data.map{|casting| Casting.new(casting)}
  end

  def self.delete_all()
    sql = "DELETE FROM castings"
    SqlRunner.run(sql)
  end

  # def movie()
  # end
  #
  # def star()
  # end


end
