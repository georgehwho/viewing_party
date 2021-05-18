require 'rails_helper'

describe 'Movie Facade Tests' do
  describe 'class methods' do
    context '#top_40_movies' do
      it 'returns an array of the top 40 movies' do
        stub_top_40_movies

        movies = MovieFacade.top_40_movies

        expect(movies).to be_a Array
        expect(movies.size).to eq(40)
      end
    end

    context '#find_movies' do
      it 'returns an array of 40 movies realted to the query' do
        stub_find_movies_phoenix

        movies = MovieFacade.find_movies('phoenix')

        expect(movies).to be_a Array
        expect(movies.size).to eq(40)
      end
    end

    context '#find_movie' do
      it 'returns a movie poro with the correct movie_id' do
        stub_dilwale_dulhania

        movie = MovieFacade.find_movie(19404)

        expect(movie).to be_a Movie
      end
    end
  end
end