class BookSerializer < ActiveModel::Serializer
  attributes :title, :author, :genre
end
