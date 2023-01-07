FactoryBot.define do
  factory :review do
    user_review { Faker::Lorem.sentence(word_count: 12) }
    score { Faker::Number.between(from: 1, to: 10) }
    user
    book
  end
end
