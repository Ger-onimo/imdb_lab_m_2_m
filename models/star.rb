require('pg')
require_relative("../db/sql_runner")
require_relative('casting')
require_relative('movie')


class Star

  attr_reader :id
  attr_accessor :first_name, :last_name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @first_name = options['first_name']
    @last_name = options['last_name']
  end

  def save()
    sql = "INSERT INTO stars
    (
      first_name,
      last_name
    )
    VALUES
    (
      $1, $2
    )
    RETURNING id"
    values = [@first_name, @last_name]
    star = SqlRunner.run(sql, values).first
    @id = star['id'].to_i
  end


  def self.all()
    sql = "SELECT * FROM stars"
    values = []
    stars = SqlRunner.run(sql, values)
    result = stars.map{ |star| Star.new(star)}
    return result
  end

  def self.delete_all()
      sql = "DELETE FROM stars"
      SqlRunner.run(sql)
  end

  def movies()
    sql = "SELECT movies.* FROM
      movies INNER JOIN castings
      ON castings.movie_id = movies.id
      WHERE movie_id = $1"
      values = [@id]
      movie_hash = SqlRunner.run(sql, values)
      return movie_hash.map{|movie| Movie.new(movie)}

  end
end
