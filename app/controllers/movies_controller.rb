class MoviesController < ApplicationController
  def discover; end

  def index
    if params[:q].nil?
      @movies = MovieFacade.top_40_movies
    else
      @movies = MovieFacade.find_movies(params[:q])
    end
  end

  def show
    @movie = MovieFacade.find_movie(params[:id])
  end
end
