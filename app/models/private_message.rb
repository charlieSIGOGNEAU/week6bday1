class PrivateMessage < ApplicationRecord
  belongs_to :sender, class_name: "User"
  has_many :private_messages_users
  has_many :recipients, through: :private_messages_users, source: :user
end
 
