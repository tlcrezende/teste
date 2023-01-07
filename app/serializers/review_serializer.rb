class ReviewSerializer < ActiveModel::Serializer
  attributes :id, :user_review, :score
  has_one :book
  has_one :user
end
