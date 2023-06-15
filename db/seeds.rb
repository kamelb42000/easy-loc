# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alonge the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
User.destroy_all

user1 = User.create!(email: 'billal.m@gmail.com', password: 'password', first_name: 'Billal', last_name: 'Medjou')
user2 = User.create!(email: 'Kamel.b@gmail.com', password: 'password', first_name: 'Kamel', last_name: 'Besseghier')
user3 = User.create!(email: 'Mehdi.m@gmail.com', password: 'password', first_name: 'Mehdi', last_name: 'Medjou')
user4 = User.create!(email: 'Jean.d@gmail.com', password: 'password', first_name: 'Jean', last_name: 'Dupont')

puts "Creating users ..."

realty1 = Realty.create!(name: "Loft meublé en bord de mer", address: "20 rue de la fraternité, marseille", user: user1, category: "Loft", rent: "850€")
realty2 = Realty.create!(name: "Appartement T3 non meublé", address: "22 rue René Leynaud, Lyon 1", user: user1, category: "Apartment", rent: "910€")
realty3 = Realty.create!(name: "Pavillon", address: "23 rue Antoine Barbier, Lyon 6", user: user1, category: "Maison", rent: "1220€")
realty4 = Realty.create!(name: "Studio", address: "2 rue Vauban, Lyon", user: user1, category: "Studio", rent: "765€")
realty5 = Realty.create!(name: "Appartement T2", address: "4 rue Waldeck-Rousseau, Lyon 6", user: user1, category: "Appartement", rent: "640€")

puts "Creating realties ..."

Message.create!(content: "Bonjour Monsieur Besseghier, je vous contacte concernant votre problème de chaudière. Un professionel passera le 19/06/2023 à 10h30. Confirmez-moi votre disponibilité svp.", user: user1, realty: realty1)

puts "Document created!"

claim = Claim.create!(title: "Chaudière : erreur 104 inconnu", content: "La chaudière a cessé de fonctionner depuis le 12/06/2023. Elle affiche le message d'erreur '104'. Serait-il possible de régler ce problème en faisant intervenir un professionnel ? Cordialement, Kamel B.", realty: realty1, tenant: user2)
claim.photo.attach(io: File.open(Rails.root.join('db', 'assets_seed', 'claims', 'Erreur_104.png')), filename: "Erreur-104.png", content_type: "image/png")

Tenant.create!(enter_date: Date.today.beginning_of_month, out_date: Date.today + 1.year, realty: realty1, user: user2)
puts "Creating tenants ..."

document = Document.create!(name: "Quittance de loyer", realty: realty1)
document.photo.attach(io: File.open(Rails.root.join('db', 'assets_seed', 'documents', 'quittance-de-loyer.pdf')), filename: "quittance-de-loyer.pdf", content_type: "image/pdf")
document = Document.create!(name: "Carte d'identité", realty: realty1)
document.photo.attach(io: File.open(Rails.root.join('db', 'assets_seed', 'documents', 'ID_card.pdf')), filename: "carte-d'idendité.pdf", content_type: "image/pdf")
document = Document.create!(name: "APL", realty: realty1)
document.photo.attach(io: File.open(Rails.root.join('db', 'assets_seed', 'documents', 'Caf.pdf')), filename: "APL.pdf", content_type: "image/pdf")
document.save
