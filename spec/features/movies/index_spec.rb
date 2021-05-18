require 'rails_helper'

describe 'Movie Index Page' do
  context 'You land on the /movies path after logging in' do
    before {
      user = create(:random_user)
      visit root_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_on "Sign In"
    }

    it 'loads the top 40 movies by default' do
      stub_top_40_movies

      visit movies_path

      expect(page).to have_content("Dilwale Dulhania Le Jayenge")
      expect(page).to have_content("City of God")
    end

    it 'allows you to search for movies from the default page' do
      stub_top_40_movies
      stub_find_movies_phoenix

      visit movies_path

      fill_in 'q', with: 'phoenix'
      click_on 'Find Movies'

      expect(page).to have_content("Dark Phoenix")
      expect(page).to have_content("Deep Purple: Phoenix Rising")
    end
  end
end