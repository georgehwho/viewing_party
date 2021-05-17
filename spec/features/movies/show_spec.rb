require 'rails_helper'

describe 'Movie Show Page' do
  context 'you go to the movies page' do
    before {
      user = create(:random_user)
      visit root_path
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_on "Sign In"
    }

    it 'Shows the correct movie Dilwale Dulhania Le Jayenge and the movie details' do
      json_response_movies_one = File.read('spec/fixtures/top_rated_page_one.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['themoviesdb_key']}&page=1").
          to_return(status: 200, body: json_response_movies_one, headers: {})

      json_response_movies_two = File.read('spec/fixtures/top_rated_page_two.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['themoviesdb_key']}&page=2").
        to_return(status: 200, body: json_response_movies_two, headers: {})

      json_response_movie_details = File.read('spec/fixtures/dilwale.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/19404?api_key=#{ENV['themoviesdb_key']}").
          to_return(status: 200, body: json_response_movie_details, headers: {})

      json_response_movie_credits = File.read('spec/fixtures/dilwale_credits.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/19404/credits?api_key=#{ENV['themoviesdb_key']}").
          to_return(status: 200, body: json_response_movie_credits, headers: {})

      json_response_movie_reviews = File.read('spec/fixtures/dilwale_reviews.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/19404/reviews?api_key=#{ENV['themoviesdb_key']}").
          to_return(status: 200, body: json_response_movie_reviews, headers: {})

      visit movies_path

      click_on "Dilwale Dulhania Le Jayenge"

      expect(current_path).to eq("/movies/19404")
      expect(page).to have_button("Create Viewing Party for Movie")

      expect(page).to have_content("Dilwale Dulhania Le Jayenge")

      expect(page).to have_content("Vote Average: 8.7")
      expect(page).to have_content("Runtime: 190")
      expect(page).to have_content("Genre(s): Comedy Drama Romance")

      expect(page).to have_content("Raj is a rich, carefree, happy-go-lucky second generation NRI. Simran is the daughter of Chaudhary Baldev Singh, who in spite of being an NRI is very strict about adherence to Indian values. Simran has left for India to be married to her childhood fiancé. Raj leaves for India with a mission at his hands, to claim his lady love under the noses of her whole family. Thus begins a saga.")
      expect(page).to have_content("Shah Rukh Khan as Raj Malhotra")
      expect(page).to have_content("Kajol as Simran Singh")
      expect(page).to have_content("Mandira Bedi as Preeti Singh")

      expect(page).to have_content("1 Review")
      expect(page).to have_content("Author: MohamedElsharkawy")
      expect(page).to have_content("The Dilwale Dulhania Le Jayenge is a film considered by most to be one of the greatest ever made. From The American Film Institute to as voted by users on the Internet Movie Database (IMDB) it is consider to be one of the best.")
    end
  end
end