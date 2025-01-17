require 'rails_helper'

describe 'Sessions New Page' do
  context 'You arrive on the page' do
    before { visit root_path }

    it 'Loads the default page' do
      expect(page).to have_content("Welcome to The Viewing Party")
      expect(page).to have_content("An application to explore movies and create a viewing party event for you and your friends to watch a movie together.")
      expect(page).to have_field("user[email]")
      expect(page).to have_field("user[password]")
      expect(page).to have_button("Sign In")
      expect(page).to have_link("New to Viewing Party? Register Here")
    end

    context 'You try to login' do
      let(:user) { create(:random_user) }

      context 'Happy Path: Correct Login' do
        before {
          fill_in 'user[email]', with: user.email
          fill_in 'user[password]', with: user.password
          click_on "Sign In"
        }

        it 'Redirects to dashboard' do
          expect(current_path).to eq(dashboard_path)
          expect(page).to have_content("Welcome #{user.email}!")
        end

        it 'Redirects to dashboard if you go to root' do
          visit root_path
          expect(current_path).to eq(dashboard_path)
        end

        it 'Redirects to dashboard if you go to /signup' do
          visit signup_path
          expect(current_path).to eq(dashboard_path)
        end

        it 'Redirects to dashboard if you go to /login' do
          visit login_path
          expect(current_path).to eq(dashboard_path)
        end
      end

      context 'Sad Path: Incorrect Logins' do
        it 'Empty form submission flashes error' do
          click_on "Sign In"

          expect(current_path).to eq(login_path)
          expect(page).to have_content('Your email or password are incorrect')
        end

        it 'Incorrect login flashes error' do
          fill_in 'user[email]', with: user.email
          fill_in 'user[password]', with: 'wrong password'
          click_on "Sign In"

          expect(current_path).to eq(login_path)
          expect(page).to have_content('Your email or password are incorrect')
        end
      end
    end
  end

end
