class Book < ApplicationRecord
  validates :title, :author, presence: true 

  has_many :user_books, dependent: :destroy
  has_many :users, through: :user_books
  has_many :reviews, dependent: :destroy

  enum genre: {
    uninformed: 0,
    adventure: 1,
    classics: 2,
    crime: 3,
    fairy_tales: 4,
    fantasy: 5,
    historical_fiction: 6,
    horror: 7,
    humour_satire: 9,
    other: 10
	}

end
