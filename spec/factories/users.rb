FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }
    description { Faker::Lorem.paragraph(25) }
    first_name { Faker::Name.first_name}
    last_name {Faker::Name.last_name}
    age {Faker::Number.number(2)}
    city {FactoryBot.create(:city)}
    password {"test1234"}
  end
end