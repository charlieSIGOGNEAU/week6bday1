class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :comments
  has_many :likes

  has_many :sent_private_messages, foreign_key: 'sender_id', class_name: "private_message"
  has_many :private_messages_users
  has_many :received_private_messages, through: :private_messages_users, source: :private_message
end
