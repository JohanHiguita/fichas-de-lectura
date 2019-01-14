

require 'faker'

Topic.destroy_all
Book.destroy_all
Autor.destroy_all
Cite.destroy_all


num_books=100
num_authors=50
num_topics=10
num_cites=300

#Topics:
num_topics.times do |i|
	Topic.create!(name: Faker::Book.unique.genre)
end



#Autors:
num_authors.times do |i|
	Autor.create!(
		 name1: Faker::Name.first_name,
		 name2: Faker::Name.middle_name,
		 lastname1: Faker::Name.last_name,
		 lastname2: Faker::Name.last_name
		 );
end


#Books:
prng = Random.new
prng1 = Random.new
prng2 = Random.new
prng3 = Random.new
num_books.times do |i|
	Book.create!(
		title: Faker::Book.unique.title, 
		editorial: Faker::Book.publisher,
		city: Faker::Nation.capital_city,
		autor_id: prng.rand(1..num_authors),
		notes: Faker::Lorem.paragraph(50,true),
		topic_ids: [
			prng1.rand(1..num_topics),
			prng2.rand(1..num_topics),
			prng3.rand(1..num_topics)
		],
		user_id: 1 
		);
end

#Cites:
#Simpsons:
prng2 = Random.new
num_cites.times do |i|
	
	if i.odd?
		Cite.create!(content: Faker::Simpsons.quote, book_id: prng2.rand(1..num_books)  )
	else
		Cite.create!(content: Faker::Friends.quote, book_id: prng2.rand(1..num_books)  )
	end
	
end




#prng.rand(1..num_books)

