# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
puts '🌱 Seeding database...'
user1 = User.create(username: 'john doe', email: 'john@example.com', password: 'john2030', active: true)

user2 = User.create(username: 'jane doe', email: 'jane@example.com', password: 'jane2030', active: true)
user3 = User.create(username: 'admin', email: 'admin@example.com', password: 'admin2030', active: true)
puts '🌱 Done seeding...'