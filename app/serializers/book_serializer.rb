class BookSerializer < ActiveModel::Serializer
  cache key: 'book', expires_in: 1.minutes
  attributes  :id, :title, :author, :genre
end
