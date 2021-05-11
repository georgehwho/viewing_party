require 'rails_helper'

describe 'Welcome Index Page' do
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
  end
end