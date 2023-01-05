require "rails_helper"

RSpec.describe Api::V1::BooksController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(get: "/api/books").to route_to({"format"=>:json, "controller"=>"api/v1/books", "action"=>"index"})
    end

    it "routes to #show" do
      expect(get: "/api/books/1").to route_to({"format"=>:json, "controller"=>"api/v1/books", "action"=>"show", "id"=>"1"})
    end


    it "routes to #create" do
      expect(post: "/api/books").to route_to({"format"=>:json, "controller"=>"api/v1/books", "action"=>"create"})
    end

    it "routes to #update via PUT" do
      expect(put: "/api/books/1").to route_to({"format"=>:json, "controller"=>"api/v1/books", "action"=>"update", "id"=>"1"})
    end

    it "routes to #destroy" do
      expect(delete: "/api/books/1").to route_to({"format"=>:json, "controller"=>"api/v1/books", "action"=>"destroy", "id"=>"1"})
    end
  end
end
