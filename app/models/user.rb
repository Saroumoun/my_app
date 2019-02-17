class User < ApplicationRecord
  attr_accessor :remember_token

	belongs_to :city
	has_many :gossips
	has_many :sent_messages, foreign_key: 'sender_id', class_name: "Message"
	has_many :received_messages, foreign_key: 'recipient_id', class_name: "Message"
  has_many :comments
  has_many :likes

  has_secure_password
  validates :password, 
    presence: true,
    length: {minimum: 6}

	validates :email,
    presence: true,
    uniqueness: true,
    format: { with: /\A[^@\s]+@([^@\s]+\.)+[^@\s]+\z/, message: "email adress please" }

  validates :first_name, presence:true

  validates :last_name, presence:true

  validates :description, presence:true

  validates :age, presence:true

  validates :city, presence:true

  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  def User.new_token
    SecureRandom.urlsafe_base64
  end


  def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
  end

  def authenticated?(remember_token)
    BCrypt::Password.new(remember_digest).is_password?(remember_token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end
end
