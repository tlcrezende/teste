require 'rails_helper'

RSpec.describe 'Passwords', type: :request do
  let(:user) { create :user }

  describe 'PUT / update ' do
    it 'updates password' do
      put '/api/auth', params: {
        password: 'newpassword'
      }, headers: user.create_new_auth_token, as: :json
      user.reload
      expect(user.valid_password?('newpassword')).to be_truthy
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'not updates password' do
      put '/api/auth', params: {}, headers: user.create_new_auth_token, as: :json
      expect(response).to have_http_status(:unprocessable_entity)
      expect(json_response).to have_key(:errors)
    end
  end
end