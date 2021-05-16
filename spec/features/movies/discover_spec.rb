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
        expect(page).to have_field("movie_title")
        expect(page).to have_button("Find Movies")
      end
    end
  end
end