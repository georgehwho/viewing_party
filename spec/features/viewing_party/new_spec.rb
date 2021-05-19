require 'rails_helper'

describe 'viewing party new page' do
  context 'you are about to create a viewing party for dilwale dulhania' do
    let(:user) { create(:random_user) }
    before {
      visit root_path
      fill_in 'user[email]', with: user.email
      fill_in 'user[password]', with: user.password
      click_on "Sign In"
      stub_dilwale_dulhania
      visit '/movies/19404'
    }

    context 'no friends' do
      before { click_on "Create Viewing Party for Movie" }
      it 'shows the form when you have no friends' do
        expect(page).to have_content("Dilwale Dulhania Le Jayenge")
        expect(find_field('party[duration]').value).to have_content("190")
        expect(page).to have_field("party[duration]")
        expect(page).to have_field("party[start_time]")
        expect(page).to_not have_content("Include")
        expect(page).to have_button("Create Party")
      end

      it 'fails to create if you did not select date' do
        fill_in 'party[start_time]', with: '3:00 PM'
        click_on "Create Party"
        expect(current_path).to eq('/viewing_party/new')
      end

      it 'fails to create if you did not select a time' do
        fill_in 'party[date]', with: '2021/12/25'
        click_on "Create Party"
        expect(current_path).to eq('/viewing_party/new')
      end

      it 'create a party correctly' do
        fill_in 'party[date]', with: '2021/12/25'
        fill_in 'party[start_time]', with: '3:00 PM'
        click_on "Create Party"
        expect(current_path).to eq('/dashboard')
        expect(page).to have_content("Dilwale Dulhania Le Jayenge")
      end
    end

    context 'with friends' do
      before {
        @friend_1 = create(:random_user)
        @friend_2 = create(:random_user)
        @friend_3 = create(:random_user)
        user.friends.push(@friend_1, @friend_2, @friend_3)
        click_on "Create Viewing Party for Movie"
      }
      it 'shows the form when you have friends' do
        expect(page).to have_content("Include")
        expect(page).to have_content(@friend_1.email)
        expect(page).to have_content(@friend_2.email)
        expect(page).to have_content(@friend_3.email)
      end

      it 'creates a form with adding your friend' do
        fill_in 'party[date]', with: '2021/12/25'
        fill_in 'party[start_time]', with: '3:00 PM'
        check "friend[#{@friend_1.id}]"

        click_on "Create Party"

        expect(current_path).to eq('/dashboard')
        expect(page).to have_content("Dilwale Dulhania Le Jayenge")
      end
    end
  end
end