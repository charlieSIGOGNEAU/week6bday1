class User < ApplicationRecord
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }, if: :password
  validates :password_confirmation, presence: true, if: :password_confirmation
  validates :password, confirmation: true
  validates :email, presence: true, uniqueness: true
  
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes

  has_many :sent_private_messages, foreign_key: 'sender_id', class_name: "private_message"
  has_many :private_messages_users
  has_many :received_private_messages, through: :private_messages_users, source: :private_message

  def remember(remember_token)
    remember_digest = BCrypt::Password.create(remember_token)
    self.update(remember_digest: remember_digest)
  end
end
