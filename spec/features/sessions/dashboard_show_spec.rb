require 'rails_helper'

describe 'User Dashboard aka Show Page' do
  it 'Reroutes to root if you are not logged in' do
    visit dashboard_path
    expect(current_path).to eq('/')
  end
end