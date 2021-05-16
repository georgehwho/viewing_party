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

      it 'searches for movies correctly', :vcr do
        fill_in 'q', with: 'phoenix'
        click_on 'Find Movies'

        expect(page).to have_content("Dark Phoenix")
        expect(page).to have_content("Deep Purple: Phoenix Rising")
      end
    end
  end
end