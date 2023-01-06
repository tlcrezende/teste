FactoryBot.define do
  factory :book do
    title { Faker::Book.title }
    author { Faker::Book.author }
    genre { Faker::Number.between(from: 1, to: 9) }

    trait :invalid do
      title { Faker::Book.title }
    end
  end

end
