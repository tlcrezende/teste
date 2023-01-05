class Review < ApplicationRecord
  validates :user_review, :book_id, :score, presence: true 

  belongs_to :user
  belongs_to :book
end
