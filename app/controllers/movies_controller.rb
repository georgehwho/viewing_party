class MoviesController < ApplicationController
  def discover

  end

  def index
    @movies = MovieService.new(ENV['themoviesdb_key']).all_movies
  end

  def show

  end
end
