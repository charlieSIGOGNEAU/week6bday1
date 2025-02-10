# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# db/seeds.rb

require 'faker'

# Clear existing data

Comment.destroy_all
Like.destroy_all

PrivateMessagesUser.destroy_all
PrivateMessage.destroy_all
TagGossip.destroy_all
Tag.destroy_all
Gossip.destroy_all
User.destroy_all
City.destroy_all



# Seed cities
10.times do
  city = City.create(
    name: Faker::Address.city,
    zip_code: Faker::Address.zip_code
  )
end

# Seed users
10.times do
  user = User.create(
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name,
    description: Faker::Lorem.paragraph,
    email: Faker::Internet.email,
    age: Faker::Number.between(from: 18, to: 90),
    city_id: City.all.sample.id
  )
  puts user.errors.full_messages unless user.valid?
end

# Seed gossips
20.times do
  gossip = Gossip.create(
    title: Faker::Lorem.sentence,
    content: Faker::Lorem.paragraph,
    user: User.all.sample
  )
end

# Seed tags
10.times do
  Tag.create(title: Faker::Lorem.word)
end
Gossip.all.each do |gossip|
  tags = Tag.all.sample(rand(1..3))  # Choisir entre 1 et 3 tags au hasard
  gossip.tags << tags
end

# Créer quelques messages privés
10.times do
  sender = User.all.sample  # Choisir un expéditeur au hasard parmi les utilisateurs
  recipients = User.where.not(id: sender.id).sample(rand(1..3))  # Choisir entre 1 et 3 destinataires au hasard (mais pas l'expéditeur)

  private_message = PrivateMessage.create(
    content: Faker::Lorem.paragraph,
    sender: sender
  )

  # Associer les destinataires au message privé
  private_message.recipients << recipients
end

# Seed likes
20.times do
  if rand(0..1) == 0
    Like.create(user: User.all.sample, gossip_id: Gossip.all.sample)
  else
    Like.create(user: User.all.sample, comment_id: Gossip.all.sample)
  end
end



