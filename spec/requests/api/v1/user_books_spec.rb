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

  # describe "POST /create" do
  #   context "with valid parameters" do
  #     it "creates a new UserBook" do
  #       expect {
  #         post user_books_url,
  #              params: { user_book: valid_attributes }, headers: valid_headers, as: :json
  #       }.to change(UserBook, :count).by(1)
  #     end

  #     it "renders a JSON response with the new user_book" do
  #       post user_books_url,
  #            params: { user_book: valid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:created)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "does not create a new UserBook" do
  #       expect {
  #         post user_books_url,
  #              params: { user_book: invalid_attributes }, as: :json
  #       }.to change(UserBook, :count).by(0)
  #     end

  #     it "renders a JSON response with errors for the new user_book" do
  #       post user_books_url,
  #            params: { user_book: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  # end

  describe "DELETE /destroy" do
    it "destroys the requested user_book" do
      delete "/api/user_books/#{user_book[:id]}", headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end
end
