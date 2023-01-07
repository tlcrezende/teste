require 'rails_helper'


RSpec.describe "/reviews", type: :request do

  let(:user) { create :user }
  let(:book) { create :book }
  let(:review) { create :user_book, user: user, book: book }
  let(:valid_attributes) { attributes_for :review }
  let(:invalid_attributes) { attributes_for :invalid }

  let(:valid_headers) {{ }}

  describe "GET /index" do
    it "renders a successful response" do
      get '/api/reviews', as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /index review_book" do
    it "renders a successful response" do
      get "/api/reviews/book/#{book.id}", as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /index review_user" do
    it "renders a successful response" do
      get "/api/reviews/user/#{user.id}", as: :json
      expect(response).to be_successful
    end
  end
end