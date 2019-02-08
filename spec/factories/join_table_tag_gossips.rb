FactoryBot.define do
  factory :join_table_tag_gossip do
    gossip { FactoryBot.create(:gossip) }
    tag { FactoryBot.create(:tag) }
  end
end