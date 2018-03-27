# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Product.delete_all
User.delete_all
Product.create(title: 'Roter Schal', description: 'schicker roter Schal aus Lamawolle', image_url: 'rotes_schall.jpg', price: 26.00)
Product.create(title: 'Gelber Schal', description: 'schicker gelber Schal aus Lamawolle', image_url: 'gelbes_schall.jpg', price: 23.00)
Product.create(title: 'Blauer Schal', description: 'schicker blauer Schal aus Lamawolle', image_url: 'blauer_schall.jpg', price: 30.00)
Product.create(title: 'Lila Schal', description: 'schicker lila Schal aus Lamawolle', image_url: 'lila_schall.jpg', price: 30.00)
Product.create(title: 'Scarf', description: 'schicker lila Schal aus Lamawolle', image_url: 'scarf.jpg', price: 30.00)
User.create(name: 'admin', password_digest: BCrypt::Password.create("admin"), type_of_user: 0)
User.create(name: 'user', password_digest: BCrypt::Password.create("user"), type_of_user: 1)
