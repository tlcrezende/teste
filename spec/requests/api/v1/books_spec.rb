require 'rails_helper'

RSpec.describe "/books", type: :request do
  let(:book) { create :book }
  let(:valid_attributes) { attributes_for :book }
  let(:invalid_attributes) { attributes_for :invalid }

  # This should return the minimal set of values that should be in the headers
  # in order to pass any filters (e.g. authentication) defined in
  # BooksController, or in your router and rack
  # middleware. Be sure to keep this updated too.
  let(:valid_headers) {
    {}
  }

  describe "GET /index" do
    it "renders a successful response" do
      get "/api/books", headers: valid_headers, as: :json
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
            headers: valid_headers, 
            as: :json
        }.to change(Book, :count).by(1)
      end

      it "renders a JSON response with the new book" do
        post "/api/books",
          params: { book: valid_attributes }, 
          headers: valid_headers, 
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
          params: { book:  {title: nil} }, headers: valid_headers, as: :json
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to match(a_string_including("application/json"))
      end
    end
  end

  # describe "PATCH /update" do
  #   context "with valid parameters" do
  #     let(:new_attributes) {
  #       skip("Add a hash of attributes valid for your model")
  #     }

  #     it "updates the requested book" do
  #       book = Book.create! valid_attributes
  #       patch book_url(book),
  #             params: { book: new_attributes }, headers: valid_headers, as: :json
  #       book.reload
  #       skip("Add assertions for updated state")
  #     end

  #     it "renders a JSON response with the book" do
  #       book = Book.create! valid_attributes
  #       patch book_url(book),
  #             params: { book: new_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:ok)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end

  #   context "with invalid parameters" do
  #     it "renders a JSON response with errors for the book" do
  #       book = Book.create! valid_attributes
  #       patch book_url(book),
  #             params: { book: invalid_attributes }, headers: valid_headers, as: :json
  #       expect(response).to have_http_status(:unprocessable_entity)
  #       expect(response.content_type).to match(a_string_including("application/json"))
  #     end
  #   end
  # end

  describe "DELETE /destroy" do
    it "destroys the requested book" do
      delete "/api/books/#{book[:id]}", headers: valid_headers, as: :json
      expect(response).to be_successful
    end
  end
end
