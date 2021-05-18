class Movie
  attr_reader :title,
              :vote_average,
              :runtime,
              :genres,
              :overview,
              :cast,
              :reviews

  def initialize(movie, cast, reviews)
    @title = movie[:title]
    @vote_average = movie[:vote_average]
    @runtime = movie[:runtime]
    @genres = movie[:genres]
    @overview = movie[:overview]
    @cast = cast
    @reviews = reviews
  end
end
