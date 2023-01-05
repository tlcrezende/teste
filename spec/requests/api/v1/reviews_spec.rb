# require 'rails_helper'


# RSpec.describe "/reviews", type: :request do

#   let(:valid_attributes) {
#     skip("Add a hash of attributes valid for your model")
#   }

#   let(:invalid_attributes) {
#     skip("Add a hash of attributes invalid for your model")
#   }


#   let(:valid_headers) {
#     {}
#   }

#   describe "GET /index" do
#     it "renders a successful response" do
#       Review.create! valid_attributes
#       get reviews_url, headers: valid_headers, as: :json
#       expect(response).to be_successful
#     end
#   end

#   describe "POST /create" do
#     context "with valid parameters" do
#       it "creates a new Review" do
#         expect {
#           post reviews_url,
#                params: { review: valid_attributes }, headers: valid_headers, as: :json
#         }.to change(Review, :count).by(1)
#       end

#       it "renders a JSON response with the new review" do
#         post reviews_url,
#              params: { review: valid_attributes }, headers: valid_headers, as: :json
#         expect(response).to have_http_status(:created)
#         expect(response.content_type).to match(a_string_including("application/json"))
#       end
#     end

#     context "with invalid parameters" do
#       it "does not create a new Review" do
#         expect {
#           post reviews_url,
#                params: { review: invalid_attributes }, as: :json
#         }.to change(Review, :count).by(0)
#       end

#       it "renders a JSON response with errors for the new review" do
#         post reviews_url,
#              params: { review: invalid_attributes }, headers: valid_headers, as: :json
#         expect(response).to have_http_status(:unprocessable_entity)
#         expect(response.content_type).to match(a_string_including("application/json"))
#       end
#     end
#   end
# end