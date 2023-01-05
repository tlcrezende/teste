require "rails_helper"

RSpec.describe Api::V1::UserBooksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/user_books").to route_to({"format"=>:json, "controller"=>"api/v1/user_books", "action"=>"index"})
    end

    it "routes to #create" do
      expect(post: "/api/user_books").to route_to({"format"=>:json, "controller"=>"api/v1/user_books", "action"=>"create"})
    end

    it "routes to #destroy" do
      expect(delete: "/api/user_books/1").to route_to({"format"=>:json, "controller"=>"api/v1/user_books", "action"=>"destroy", "id"=>"1"})
    end
  end
end