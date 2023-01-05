class Book < ApplicationRecord
  validates :title, :author, presence: true 

  has_many :user_books
  has_many :users, through: :user_books
end
