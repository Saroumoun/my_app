class AddAnotherIndexToComments < ActiveRecord::Migration[5.2]
  def change
  	add_reference :comments, :gossip, foreign_key: true, index: true
  end
end
