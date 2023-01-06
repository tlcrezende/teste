class BookSerializer < ActiveModel::Serializer
  cache key: 'book', expires_in: 1.minutes
  attributes :title, :author, :genre
end
