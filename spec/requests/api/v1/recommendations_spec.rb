require 'rails_helper'

RSpec.describe "/recommendation", type: :request do

  let(:user) { create :user }
  let(:review) { create :user_book, user: user, book: book }
  let(:valid_attributes) { attributes_for :review }
  let(:invalid_attributes) { attributes_for :invalid }

  let(:valid_headers) { user.create_new_auth_token }

  # describe "GET /recommendation" do
  #   it "renders a successful response" do
  #     get '/api/recommendation', headers: valid_headers, as: :json
  #     expect(response).to be_successful
  #   end
  # end

  # describe "GET /other_recommendation" do
  #   it "renders a successful response" do
  #     get "/api/other_recommendation", as: :json
  #     expect(response).to be_successful
  #   end
  # end


end
