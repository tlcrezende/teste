require 'rails_helper'

RSpec.describe Api::V1::RecommendationsController, type: :controller do
  it { should use_before_action(:authenticate_api_user!) }
  it { should use_before_action(:get_first_recommendation) }
  it { should use_before_action(:get_other_recommendation) }
end