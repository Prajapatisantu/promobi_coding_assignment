FactoryBot.define do
  factory :course do
    name { Faker::Lorem.sentence }
    description { Faker::Lorem.paragraph }
  end
end