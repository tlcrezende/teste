require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:email) }
    it { should allow_value('example@domain.com').for(:email) }
    it { should validate_length_of(:password).is_at_least(2) }
  end


end