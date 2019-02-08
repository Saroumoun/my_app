require 'rails_helper'
RSpec.describe Tag, type: :model do

  before(:each) do 
    @tag = FactoryBot.create(:tag)    
  end

  it "has a valid factory" do
    expect(build(:tag)).to be_valid
  end

  context "validation" do
    it "is valid with valid attributes" do
      expect(@tag).to be_a(Tag)
    end
    describe "#content" do
      it { expect(@tag).to validate_presence_of(:title) }
    end
  end

  context "associations" do
    it { expect(@tag).to have_many(:join_table_tag_gossips) }
  end



end