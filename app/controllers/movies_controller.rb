class MoviesController < ApplicationController
  def discover; end

  def index
    movie_service = MovieService.new(ENV['themoviesdb_key'])
    if params[:q].nil?
      @movies = movie_service.all_movies
    else
      @movies = movie_service.find_movies(params[:q])
    end
  end

  def show
    movie_service = MovieService.new(ENV['themoviesdb_key'])
    @movie = movie_service.find_movie(params[:id])
    @cast = movie_service.find_movie_credits(params[:id])[:cast][0..9]
    @reviews = movie_service.find_movie_review(params[:id])[:results]
  end
end
