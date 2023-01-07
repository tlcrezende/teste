require 'rails_helper'

RSpec.describe "/user_books", type: :request do
  
  let(:user) { create :user }
  let(:book) { create :book }
  let(:user_book) { create :user_book, user: user, book: book }
  let(:valid_attributes) { attributes_for :user_book }
  let(:invalid_attributes) { attributes_for :invalid }

  let(:valid_headers) { user.create_new_auth_token }


  describe "GET /index" do
    it "renders a successful response" do
      get "/api/user_books", headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested user_book" do
      delete "/api/user_books/#{user_book[:id]}", headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end
end
