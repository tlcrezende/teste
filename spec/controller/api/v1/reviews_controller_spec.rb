require 'rails_helper'

RSpec.describe Api::V1::ReviewsController, type: :controller do
  it { should use_before_action(:authenticate_api_user!) }
  it { should use_before_action(:set_review_books) }
  it { should use_before_action(:average_book) }
  it { should use_before_action(:set_review_users) }
end