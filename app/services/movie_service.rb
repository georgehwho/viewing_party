class MovieService
  def initialize(api_key)
    @api_key = api_key
  end

  def conn
    Faraday.new(url: 'https://api.themoviedb.org/3')
  end

  def all_movies
    first_resp = conn.get("movie/top_rated?api_key=#{@api_key}&page=1")
    second_resp = conn.get("movie/top_rated?api_key=#{@api_key}&page=2")

    first_half = JSON.parse(first_resp.body, symbolize_names: true)
    second_half = JSON.parse(second_resp.body, symbolize_names: true)

    first_half[:results] + second_half[:results]
  end
end