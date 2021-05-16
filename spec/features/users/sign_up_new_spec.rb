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

  context 'You register for an account' do
    before {
      visit signup_path
    }
    it 'can register a new account' do
      expect(current_path).to eq('/signup')

      fill_in 'user[email]', with: 'kon@test.com'
      fill_in 'user[password]', with: 'boomshakalaka'
      fill_in 'user[password_confirmation]', with: 'boomshakalaka'

      click_on "Register"

      expect(current_path).to eq(dashboard_path)

      new_user = User.last

      expect(page).to have_content("Welcome #{new_user.email}!")
      expect(new_user.email).to eq('kon@test.com')
    end

    it 'fails to register for an account' do
      click_on 'Register'
      expect(current_path).to eq('/signup')
    end
  end
end
