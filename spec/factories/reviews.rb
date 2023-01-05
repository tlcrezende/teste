FactoryBot.define do
  factory :review do
    user_review { "MyText" }
    score { 1.5 }
    user { nil }
    book { nil }
  end
end
