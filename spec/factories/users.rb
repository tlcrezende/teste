FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    name { Faker::Name.name }
    uid { email }
    password { '123' }
    password_confirmation { '123' }
  end
end