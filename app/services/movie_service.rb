class MovieService
  def initialize(api_key)
    @api_key = api_key
  end

  def conn
    Faraday.new(
      url: 'https://api.themoviedb.org'
    )
  end


  # movie_api = ENV["themoviesdb_key"]
  # response = Faraday.get("https://api.themoviedb.org/3/movie/550?api_key=#{movie_api}")
  # json = JSON.parse(response.body, symbolize_names: true)
  # binding.pry
end