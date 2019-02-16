class AddIndexToLikes < ActiveRecord::Migration[5.2]
  def change
  	add_reference :likes, :user, foreign_key: true, index: true
  	add_reference :likes, :gossip, foreign_key: true, index: true
  end
end
