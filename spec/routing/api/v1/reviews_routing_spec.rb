require "rails_helper"

RSpec.describe Api::V1::ReviewsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/reviews").to route_to({"format"=>:json, "controller"=>"api/v1/reviews", "action"=>"index"})
    end

    it "routes to #create" do
      expect(post: "/api/reviews").to route_to({"format"=>:json, "controller"=>"api/v1/reviews", "action"=>"create"})
    end

    it "routes to #index_book" do
      expect(get: "/api/reviews/book/1").to route_to( {"format"=>:json, "controller"=>"api/v1/reviews", "action"=>"index_book", "id"=>"1"})
    end

    it "routes to #index_user" do
      expect(get: "/api/reviews/user/1").to route_to({"format"=>:json, "controller"=>"api/v1/reviews", "action"=>"index_user", "id"=>"1"})
    end
  end
end
