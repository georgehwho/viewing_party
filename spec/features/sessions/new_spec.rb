require 'rails_helper'

describe 'Sessions New Page' do
  context 'You arrive on the page' do
    before {
      visit root_path
    }
    it 'Welcomes you to the site' do
      expect(page).to have_content("Welcome to The Viewing Party")
    end
    it 'Has a description of the application' do
      expect(page).to have_content("An application to explore movies and create a viewing party event for you and your friends to watch a movie together.")
    end
    it 'Has a form that will allow me to sign in' do
      expect(page).to have_field("email")
      expect(page).to have_field("password")
      expect(page).to have_button("Sign In")
    end
    it 'Has a link to register for the application' do
      expect(page).to have_link("New to Viewing Party? Register Here")
    end

    it 'Has a sad path for when email or password is incorrect' do
      click_on "Sign In"

      expect(page).to have_content('Your email or password are incorrect')
    end
  end
end
