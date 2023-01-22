require "rails_helper"

RSpec.describe Api::V1::RecommendationsController, type: :routing do
  describe "routing" do
    it "routes to #first" do
      expect(get: "/api/recommendation").to route_to({"format"=>:json, "controller"=>"api/v1/recommendations", "action"=>"first"})
    end

    it "routes to #other" do
      expect(get: "/api/other_recommendation").to route_to({"format"=>:json, "controller"=>"api/v1/recommendations", "action"=>"other"})
    end
  end
end
