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

  def find_movie(movie_id)
    resp = conn.get("movie/#{movie_id}?api_key=#{@api_key}")
    JSON.parse(resp.body, symbolize_names: true)
  end

  def find_movie_review(movie_id)
    resp = conn.get("movie/#{movie_id}/reviews?api_key=#{@api_key}")
    JSON.parse(resp.body, symbolize_names: true)
  end

  def find_movie_credits(movie_id)
    resp = conn.get("movie/#{movie_id}/credits?api_key=#{@api_key}")
    JSON.parse(resp.body, symbolize_names: true)
  end

  def find_movies(search)
    first_resp = conn.get("search/movie?api_key=#{@api_key}&query=#{search}&page=1")
    second_resp = conn.get("search/movie?api_key=#{@api_key}&query=#{search}&page=2")

    first_half = JSON.parse(first_resp.body, symbolize_names: true)
    second_half = JSON.parse(second_resp.body, symbolize_names: true)

    first_half[:results] + second_half[:results]
  end
end