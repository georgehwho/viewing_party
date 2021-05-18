require 'rails_helper'

describe 'User Dashboard aka Show Page' do
  context 'you are not logged in' do
    it 'Reroutes to root if you are not logged in' do
      visit dashboard_path
      expect(current_path).to eq('/')
    end
  end

  context 'you are logged in' do
    let(:user) { create(:random_user) }
    before {
      visit root_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_on 'Sign In'
    }

    it 'automatially lands you on the dashboard page' do
      expect(current_path).to eq("/dashboard")
    end

    context 'friend list' do
      it 'has a form that allows you to add friends' do
        expect(page).to have_content('Friend\'s email')
      end

      it 'properly shows you have no friends' do
        expect(page).to have_content("You currently have no friends")
      end

      context 'happy path: add friends properly' do
        let(:friend) { create(:random_user) }

        it 'adds a friend' do
          fill_in 'user[email]', with: friend.email
          click_on 'Add Friend'

          expect(page).to have_content(friend.email)
        end
      end

      context 'sad path: add friends incorrectly' do
        it 'when you submit an empty friend' do
          click_on 'Add Friend'

          expect(page).to have_content('Friend not found!')
        end

        it 'when you try to add a user who does not exist' do
          fill_in 'user[email]', with: 'friend.email'
          click_on 'Add Friend'

          expect(page).to have_content('Friend not found!')
        end

        it 'when you submit add yourself' do
          fill_in 'user[email]', with: user.email
          click_on 'Add Friend'

          expect(page).to have_content('You cannot be your own friend!')
        end

        it 'when you try to add the same friend twice' do
          friend = create(:random_user)

          fill_in 'user[email]', with: friend.email
          click_on 'Add Friend'

          fill_in 'user[email]', with: friend.email
          click_on 'Add Friend'

          expect(page).to have_content('You already added this friend!')
        end
      end
    end
  end
end