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
    humour_satire: 8,
    other: 9
	}

  # Pesquisa por título e autor 
  scope :search_by_title, -> (search_by_title) { where('LOWER(title) LIKE ?', "%#{search_by_title.downcase}%") if search_by_title.present? }
  scope :search_by_author, -> (search_by_author) { where('LOWER(author) LIKE ?', "%#{search_by_author.downcase}%") if search_by_author.present? }
  
  # Pesquisa por gênero, bloqueando gênero que não estão no enum genre e retornando uninformed 
  scope :search_by_genre, -> (search_by_genre) { where('genre = ?', "#{Book.genres[search_by_genre].nil? ? 0 : Book.genres[search_by_genre]}") if search_by_genre.present? }

end
