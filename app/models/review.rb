class Review < ApplicationRecord
  validates :user_review, :book_id, :score, presence: true 
  validates :score, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 10 }

  belongs_to :user
  belongs_to :book
end
