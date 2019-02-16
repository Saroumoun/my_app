class Gossip < ApplicationRecord
	belongs_to :user
	has_many :join_table_tag_gossips, dependent: :destroy
	has_many :tags, through: :join_table_tag_gossips, dependent: :destroy
	has_many :comments, dependent: :destroy
	has_many :likes, dependent: :destroy

	validates :title, presence: true, length: { in: 3..50 }
	
  validates :content, presence: true
end
