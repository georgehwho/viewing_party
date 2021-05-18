class MovieFacade
  def self.top_40_movies
    movies = MovieService.request_api('movie/top_rated?page=1')[:results]
    movies + MovieService.request_api('movie/top_rated?page=2')[:results]
  end

  def self.find_movies(query)
    movies = MovieService.request_api("search/movie?query=#{query}&page=1")[:results]
    movies + MovieService.request_api("search/movie?query=#{query}&page=2")[:results]
  end

  def self.find_movie(movie_id)
    movie = MovieService.request_api("movie/#{movie_id}")
    cast = MovieService.request_api("movie/#{movie_id}/credits")[:cast][0..9]
    reviews = MovieService.request_api("movie/#{movie_id}/reviews")[:results]

    Movie.new(movie, cast, reviews)
  end
end
