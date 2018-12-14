# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Topic.destroy_all
Book.destroy_all
Autor.destroy_all
Cite.destroy_all
Note.destroy_all 

 
 


num_books=200
num_authors=50
num_topics=10
num_notes=300
num_cites=150

#Topics:
num_topics.times do |i|
	Topic.create(id: i+1, name: Faker::Book.unique.genre)
end

#Autors:

num_authors.times do |i|
	Autor.create!(id: i+1, name1: Faker::Name.first_name, name2: Faker::Name.middle_name,
		lastname1: Faker::Name.last_name, lastname2: Faker::Name.last_name );
end


#Books:
prng = Random.new
num_books.times do |i|
	Book.create!(
		id: i+1, 
		title: Faker::Book.unique.title, 
		editorial: Faker::Book.publisher,
		city: Faker::Nation.capital_city,
		autor_id: prng.rand(1..num_authors),
		topic_ids: [
			prng.rand(1..num_topics),
			prng.rand(1..num_topics),
			prng.rand(1..num_topics)
		],
		user_id: 1 
		);
end

#Notes:

num_notes.times do |i|
	prng = Random.new
	Note.create!(id: i+1, content: Faker::Lorem.sentence, book_id: prng.rand(1..num_books) )
end

#Cites:

num_cites.times do |i|
	prng = Random.new
	Cite.create!(id: i+1, content: Faker::Simpsons.quote, book_id: prng.rand(1..num_books) )
end

