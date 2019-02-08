FactoryBot.define do
  factory :gossip do
    title { Faker::Book.title }
    content { Faker::Hobbit.quote }
    user {FactoryBot.create(:user)}
  end
end