# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all
user1 = User.create!(email: 'user1@gmail.com', password: 'password', first_name: 'Billal')
user2 = User.create!(email: 'user2@gmail.com', password: 'password')
puts "Creating users ..."

realty1 = Realty.create!(name: "Loft", address: "20 rue des capucins", user: user1, category: "loft", rent: "20€")
puts "Creating realties ..."


Message.create!(content: "Salut, çava ?", user: user1, realty: realty1)

Document1 = Document.create(name:"1er document", realty: realty1)
Document2 = Document.create(name:" document", realty: realty1)
Document3 = Document.create(name:" document", realty: realty1)
Document4 = Document.create(name:" document", realty: realty1)
Document5 = Document.create(name:" document", realty: realty1)
puts "Document created!"

Claim.create!(title: "Chaudière", content: "Super", realty_id: realty1.id)

Tenant.create!(enter_date: Date.today, out_date: Date.today, realty_id: realty1.id, user_id: user2.id)
puts "Creating tenants ..."


Message.create!(content: "Salut, çava ?", user: user1, realty: realty1)
