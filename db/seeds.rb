# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alonge the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all

user1 = User.create!(email: 'user1@gmail.com', password: 'password', first_name: 'Billal', last_name: 'Medjou')
user2 = User.create!(email: 'user2@gmail.com', password: 'password', first_name: 'Kamel', last_name: 'Besseghier')
user3 = User.create!(email: 'user3@gmail.com', password: 'password', first_name: 'Mehdi', last_name: 'Medjou')
user4 = User.create!(email: 'user4@gmail.com', password: 'password', first_name: 'Jean', last_name: 'Dupont')

puts "Creating users ..."

realty1 = Realty.create!(name: "Loft", address: "20 rue des capucins", user: user1, category: "Loft", rent: "350€")
realty2 = Realty.create!(name: "Appartement", address: "22 rue René Leynaud,Lyon", user: user1, category: "Apartment", rent: "450€")
realty3 = Realty.create!(name: "Maison", address: "23 rue Antoine Barbier, Lyon", user: user1, category: "Maison", rent: "890€")
realty4 = Realty.create!(name: "Studio", address: "2 rue Vauban, Lyon", user: user1, category: "Studio", rent: "765€")
realty5 = Realty.create!(name: "Appartement", address: "4 rue Waldeck-Rousseau, Lyon", user: user1, category: "Appartement", rent: "990€")

puts "Creating realties ..."

Message.create!(content: "Bonjour Monsieur Besseghier, je vous contacte concernant la chaudière. Un professionel passera le 16/06/2023 à 10h30.", user: user1, realty: realty1)

puts "Document created!"

claim = Claim.create!(title: "Chaudière : erreur 104", content: "La chaudière a cessé de fonctionner depuis le 12/06/2023. Elle affiche le message d'erreur '104'. ", realty: realty1, tenant: user2)
claim.photo.attach(io: File.open(Rails.root.join('db', 'assets_seed', 'claims', 'erreur_104.png')), filename: "erreur-104.png", content_type: "image/png")

Tenant.create!(enter_date: Date.today, out_date: Date.today, realty: realty1, user: user2)
puts "Creating tenants ..."

document = Document.create!(name: "Quittance de loyer", realty: realty1)
document.photo.attach(io: File.open(Rails.root.join('db', 'assets_seed', 'documents', 'quittance-de-loyer.pdf')), filename: "quittance-de-loyer.pdf", content_type: "image/pdf")
document = Document.create!(name: "Carte d'identité", realty: realty1)
document.photo.attach(io: File.open(Rails.root.join('db', 'assets_seed', 'documents', 'ID_card.pdf')), filename: "carte-d'idendité.pdf", content_type: "image/pdf")
document = Document.create!(name: "APL", realty: realty1)
document.photo.attach(io: File.open(Rails.root.join('db', 'assets_seed', 'documents', 'CAF.pdf')), filename: "APL.pdf", content_type: "image/pdf")
document.save
