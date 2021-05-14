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

    it 'loads the top 40 movies by default', :vcr do
      visit movies_path

      expect(page).to have_content("Dilwale Dulhania Le Jayenge")
      expect(page).to have_content("City of God")
    end
  end
end