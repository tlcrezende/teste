class Book < ApplicationRecord
  validates :title, :author, presence: true 

  has_many :user_books, dependent: :destroy
  has_many :users, through: :user_books
end
