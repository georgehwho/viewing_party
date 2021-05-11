require 'rails_helper'

describe User, type: :model do
  describe 'relationships' do

  end

  describe 'validations' do
    it { should validate_presence_of(:email) }
  end
end