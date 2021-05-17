require 'rails_helper'

describe 'Discover Movies Page' do
  context 'You are logged in' do
    before {
      user = create(:random_user)
      visit root_path
      fill_in 'email', with: user.email
      fill_in 'password', with: user.password
      click_on "Sign In"
    }
    context 'You land on the discover page' do
      before { visit discover_path }

      it 'has a button for finding top rated movies' do
        expect(page).to have_button("Find Top Rated Movies")
      end

      it 'has a search bar that lets you find movies' do
        expect(page).to have_field("q")
        expect(page).to have_button("Find Movies")
      end

      it 'searches for movies correctly' do
        json_response_one = File.read('spec/fixtures/phoenix_search_one.json')
        stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['themoviesdb_key']}&query=phoenix&page=1").
           to_return(status: 200, body: json_response_one, headers: {})

        json_response_two = File.read('spec/fixtures/phoenix_search_two.json')
           stub_request(:get, "https://api.themoviedb.org/3/search/movie?api_key=#{ENV['themoviesdb_key']}&query=phoenix&page=2").
              to_return(status: 200, body: json_response_two, headers: {})

        fill_in 'q', with: 'phoenix'
        click_on 'Find Movies'

        expect(page).to have_content("Dark Phoenix")
        expect(page).to have_content("Deep Purple: Phoenix Rising")
      end
    end
  end
end