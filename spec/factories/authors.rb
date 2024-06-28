require 'faker'

FactoryBot.define do
  factory :author, class: Lines::Author do |f|
    name { Faker::Name.name }
    email { Faker::Internet.email }
    description { "dsf" }
  end
end
