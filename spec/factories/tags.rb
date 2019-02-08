FactoryBot.define do
  factory :tag do
    title { Faker::Music.genre }
  end
end