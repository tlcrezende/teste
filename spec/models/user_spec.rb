require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should allow_value('example@domain.com').for(:email) }
    it { should validate_length_of(:password).is_at_least(2) }
  end
  
  describe 'associations' do
    it { should have_many(:user_books).dependent(:destroy) }
    it { should have_many(:books) }
  end

end