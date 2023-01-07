require 'rails_helper'

RSpec.describe Book, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:author) }
  end

  describe 'associations' do
    it { should have_many(:user_books).dependent(:destroy) }
    it { should have_many(:users) }
    it { should have_many(:reviews).dependent(:destroy)  }
  end
end
