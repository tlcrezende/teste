require 'rails_helper'

RSpec.describe 'Registrations', type: :request do
  let(:user) { create :user }
  let(:valid_attributes) { attributes_for :user}

  describe 'POST / create ' do
    it 'creates a new User' do
      expect do
        post '/api/auth', params: valid_attributes
      end.to change(User, :count).by(1)
    end

    it 'not creates a new User' do
      expect do
        post '/api/auth', params: {}
      end.to change(User, :count).by(0)


      post '/api/auth', params: {}
      expect(json_response).to have_key(:errors)
      expect(response).to have_http_status(:unprocessable_entity)
    end
  end

  describe 'PUT / update ' do
    let(:new_name) { Faker::Name.name }

    it 'updates the user name' do
      put '/api/auth', params: { name: new_name }, headers: user.create_new_auth_token, as: :json
      user.reload
      expect(user.name).to eq(new_name)
      expect(response).to have_http_status(:ok)
      expect(response.content_type).to eq('application/json; charset=utf-8')
    end

    it 'not updates the user email' do
      put '/api/auth', params: { email: ""}
      expect(json_response).to have_key(:errors)
      expect(response).to have_http_status(:not_found)
    end
  end
end