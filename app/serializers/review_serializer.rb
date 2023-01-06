class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_review, :score, :book_id, :user_id, :average
  # has_one :user
  # has_one :book
end
