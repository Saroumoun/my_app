require 'rails_helper'
RSpec.describe JoinTableTagGossip, type: :model do

  before(:each) do 
    @join_table_tag_gossip = FactoryBot.create(:join_table_tag_gossip)    
  end

  it "has a valid factory" do
    expect(build(:join_table_tag_gossip)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@join_table_tag_gossip).to be_a(JoinTableTagGossip)
    end
  end

  context "associations" do
    it { expect(@join_table_tag_gossip).to belong_to(:tag) }
    it { expect(@join_table_tag_gossip).to belong_to(:gossip) }
  end



end