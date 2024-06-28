require 'faker'

FactoryBot.define do
  factory :user, class: Lines::User do |f|
    email { Faker::Internet.email }
    password { "sekret1234" }
    # f.password_confirmation "sekret"
  end
end
