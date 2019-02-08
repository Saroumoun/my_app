FactoryBot.define do
  factory :message do
    content { Faker::GreekPhilosophers.quote }
    recipient { FactoryBot.create(:user) }
    sender { FactoryBot.create(:user) }
  end
end