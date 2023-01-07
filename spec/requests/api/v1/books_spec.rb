require 'rails_helper'

RSpec.describe "/books", type: :request do
  let(:book) { create :book }
  let(:valid_attributes) { attributes_for :book }
  let(:invalid_attributes) { attributes_for :invalid }

  describe "GET /index" do
    it "renders a successful response" do
      get "/api/books", as: :json
      expect(response).to be_successful
    end
  end

  describe "GET /show" do
    it "renders a successful response" do
      get "/api/books/#{book[:id]}", as: :json
      expect(response).to be_successful
    end
  end

  describe "POST /create" do
    context "with valid parameters" do
      it "creates a new Book" do
        expect {
          post "/api/books",
            params: { book: valid_attributes }, 
            as: :json
        }.to change(Book, :count).by(1)
      end

      it "renders a JSON response with the new book" do
        post "/api/books",
          params: { book: valid_attributes }, 
          as: :json
        expect(response).to have_http_status(:created)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "does not create a new Book" do
        expect {
          post "/api/books",
            params: { book: {title: nil} }, 
            as: :json
        }.to change(Book, :count).by(0)
      end

      it "renders a JSON response with errors for the new book" do
        post "/api/books",
          params: { book:  {title: nil} }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "PUT /update" do
    context "with valid parameters" do

      it "updates the requested book" do
        put "/api/books/#{book[:id]}", params: { title: "Novo título" }, as: :json
        book.reload
        expect(book.title).to eq("Novo título")
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json; charset=utf-8')
      end

      it "renders a JSON response with the book" do
        put "/api/books/#{book[:id]}", params: { title: "Novo título" }, as: :json
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end

    context "with invalid parameters" do
      it "renders a JSON response with errors for the book" do
        put "/api/books/#{book[:id]}", params: { title: "" }, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  describe "DELETE /destroy" do
    it "destroys the requested book" do
      delete "/api/books/#{book[:id]}", as: :json
      expect(response).to be_successful
    end
  end
end
