require 'rails_helper'

describe 'Movie Index Page' do
  context 'You land on the /movies path after logging in' do
    before {
      user = create(:random_user)
      visit root_path
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_on "Sign In"
    }

    it 'loads the top 40 movies by default' do
      json_response_movies_one = File.read('spec/fixtures/top_rated_page_one.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['themoviesdb_key']}&page=1").
          to_return(status: 200, body: json_response_movies_one, headers: {})

      json_response_movies_two = File.read('spec/fixtures/top_rated_page_two.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['themoviesdb_key']}&page=2").
        to_return(status: 200, body: json_response_movies_two, headers: {})

      visit movies_path

      expect(page).to have_content("Dilwale Dulhania Le Jayenge")
      expect(page).to have_content("City of God")
    end

    it 'allows you to search for movies from the default page' do
      json_response_movies_one = File.read('spec/fixtures/top_rated_page_one.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['themoviesdb_key']}&page=1").
          to_return(status: 200, body: json_response_movies_one, headers: {})

      json_response_movies_two = File.read('spec/fixtures/top_rated_page_two.json')
      stub_request(:get, "https://api.themoviedb.org/3/movie/top_rated?api_key=#{ENV['themoviesdb_key']}&page=2").
        to_return(status: 200, body: json_response_movies_two, headers: {})

      json_response_one = File.read('spec/fixtures/phoenix_search_one.json')
      stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['themoviesdb_key']}&query=phoenix&page=1").
          to_return(status: 200, body: json_response_one, headers: {})

      json_response_two = File.read('spec/fixtures/phoenix_search_two.json')
          stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['themoviesdb_key']}&query=phoenix&page=2").
            to_return(status: 200, body: json_response_two, headers: {})
      visit movies_path

      fill_in 'q', with: 'phoenix'
      click_on 'Find Movies'

      expect(page).to have_content("Dark Phoenix")
      expect(page).to have_content("Deep Purple: Phoenix Rising")
    end
  end
end