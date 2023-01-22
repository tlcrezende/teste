# require './app/scraper/scraper.rb'

# scraper = Scraper.new
# scraper.start
# 300.times do |number|
#   book = Book.new(
#         title: scraper.output[number][:title],
#         author: scraper.output[number][:author],
#         genre: Faker::Number.between(from: 1, to: 9),
#       )
#   book.save
#   p 'Creating books' if number%10 == 0
# end


# # Creating users
# 19.times do
#   FactoryBot.create :user
#   p 'Creating users'
# end

# # Creating a new userbook with a random user_id and book_id.
# display_counter = 0
# 1200.times do |number|
#   userbook = UserBook.new(user_id: Faker::Number.between(from: 1, to: 20), book_id: Faker::Number.between(from: 1, to: 297))
#   userbook.save
#   p 'Creating user_books' if number%20 == 0
# end


# Creating reviews with random user_id and book_id.
1500.times do |number|
  review = Review.new(
    user_review: Faker::Lorem.sentence(word_count: 12),
    score: Faker::Number.between(from: 1, to: 10),
    user_id: Faker::Number.between(from: 1, to: 20),
    book_id: Faker::Number.between(from: 1, to: 297)
  )
  review.save
  p 'Creating reviews' if number%50 == 0
end



