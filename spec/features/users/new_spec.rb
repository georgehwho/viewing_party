require 'rails_helper'

describe 'New User Sign Up Page' do
  context 'You arrive on the page from the home page' do
    before {
      visit root_path

      click_on "New to Viewing Party? Register Here"
    }
    it 'Has the correct URI of /signup' do
      expect(current_path).to eq("/signup")
    end
    it 'Loads the correct header, description, and form' do
      expect(page).to have_content("Welcome to Viewing Party")
      expect(page).to have_content("Please Register for an Account")
      expect(page).to have_field("user[email]")
      expect(page).to have_field("user[password]")
      expect(page).to have_field("user[password_confirmation]")
      expect(page).to have_button("Register")
    end
  end
end