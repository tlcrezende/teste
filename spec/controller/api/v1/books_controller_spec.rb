require 'rails_helper'

RSpec.describe Api::V1::BooksController, type: :controller do
  it { should use_before_action(:set_book) }
end