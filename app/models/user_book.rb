class UserBook < ApplicationRecord
  validates :user_id, :book_id, presence: true

  belongs_to :user
  belongs_to :book

  scope :search_by_title, -> (search_by_title) { where('LOWER(title) LIKE ?', "%#{search_by_title.downcase}%") if search_by_title.present? }
  scope :search_by_author, -> (search_by_author) { where('LOWER(author) LIKE ?', "%#{search_by_author.downcase}%") if search_by_author.present? }
  scope :search_by_genre, -> (search_by_genre) { where('genre = ?', "#{search_by_genre}") if search_by_genre.present? }
  
end
