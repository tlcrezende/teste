class Api::V1::RecommendationsController < ApplicationController
  include Recommendation
  
  before_action :authenticate_api_user!
  before_action :get_first_recommendation, only: :first
  before_action :get_other_recommendation, only: :other
  
  def first
    render json: @first_recommendarion
  end

  def other 
    render json: @others_recommendarion
  end
end
