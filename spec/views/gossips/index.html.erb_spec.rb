require 'rails_helper'

RSpec.describe "gossips/index.html.erb", type: :view do
  context 'when there are gossips' do
    it 'displays the title' do
      assign(:gossips, [build(:gossip, title: 'MyTitle', id: 1)])
      render
      expect(rendered).to match(/MyTitle/)
    end
    it 'displays the author' do
      assign(:gossips, [build(:gossip, user: User.new(first_name: 'Bast', last_name: 'Hil'), id: 1)])
      render
      expect(rendered).to match(/Bast Hil/)
    end
    it 'displays the title' do
      assign(:gossips, [@gossip = FactoryBot.create(:gossip)])
      render
      expect(rendered).to match(@gossip.title)
    end
    it 'displays the author' do
      assign(:gossips, [@gossip = FactoryBot.create(:gossip)])
      render
      expect(rendered).to match(@gossip.user.first_name)
    end
  end
end 