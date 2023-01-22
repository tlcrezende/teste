require './app/scraper/scraper.rb'

scraper = Scraper.new
scraper.start
50.times do |number|
  book = Book.new(
        title: scraper.output[number][:title],
        author: scraper.output[number][:author],
        genre: Faker::Number.between(from: 1, to: 9),
      )
      book.save
end

# 9.times do
#   FactoryBot.create :user
# end

# 60.times do
#   userbook = UserBook.new(user_id: Faker::Number.between(from: 1, to: 10), book_id: Faker::Number.between(from: 1, to: 60))
#   userbook.save
# end

# 100.times do
#   review = Review.new(
#     user_review: Faker::Lorem.sentence(word_count: 12),
#     score: Faker::Number.between(from: 1, to: 10),
#     user_id: Faker::Number.between(from: 1, to: 10),
#     book_id: Faker::Number.between(from: 1, to: 60)
#   )
#   review.save
# end



