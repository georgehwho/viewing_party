require 'rails_helper'

describe User, type: :model do
  describe 'relationships' do
    it { should have_many(:friendships) }
    it { should have_many(:friends) }
  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should validate_presence_of(:password) }
  end
end