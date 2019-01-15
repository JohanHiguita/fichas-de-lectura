

require 'faker'

Topic.destroy_all
Book.destroy_all
Autor.destroy_all
Cite.destroy_all
User.destroy_all

#cantidad de datos por tabla
num_books=100
num_authors=50
num_topics=15
num_cites=300

#Alterar secuencias (evitar llave duplicada)
ActiveRecord::Base.connection.execute("ALTER SEQUENCE books_id_seq RESTART WITH #{num_books + 1}")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE topics_id_seq RESTART WITH #{num_topics + 1}")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE autors_id_seq RESTART WITH #{num_authors + 1}")
ActiveRecord::Base.connection.execute("ALTER SEQUENCE cites_id_seq RESTART WITH #{num_cites  + 1}")


#User1:
user = User.new
user.email = 'demo@gmail.com'
user.password = 'demo123'
user.password_confirmation = 'demo123'
user.save!

#Topics:
num_topics.times do |i|
	Topic.create!(id: i+1, name: Faker::Book.unique.genre, user_id: 1)
end



#Autors:
num_authors.times do |i|
	Autor.create!(
		id: i+1,
		name1: Faker::Name.first_name,
		name2: Faker::Name.middle_name,
		lastname1: Faker::Name.last_name,
		lastname2: Faker::Name.last_name,
		user_id: 1
		);
end


#Books:
prng = Random.new
prng1 = Random.new
prng2 = Random.new
prng3 = Random.new
num_books.times do |i|
	Book.create!(
		id: i+1,
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
#Simpsons / Friends:
prng1 = Random.new
prng2 = Random.new
num_cites.times do |i|
	rdm= prng1.rand(1..5)
	
	if rdm == 1
		Cite.create!(id: i+1,content: Faker::Shakespeare.hamlet_quote, book_id: prng2.rand(1..num_books)  )
	elsif rdm == 2
		Cite.create!(id: i+1,content: Faker::Shakespeare.as_you_like_it_quote, book_id: prng2.rand(1..num_books)  )
	elsif rdm == 3
		Cite.create!(id: i+1,content: Faker::Shakespeare.king_richard_iii_quote, book_id: prng2.rand(1..num_books)  )
	elsif rdm == 4
		Cite.create!(id: i+1,content: Faker::Shakespeare.romeo_and_juliet_quote, book_id: prng2.rand(1..num_books)  )	
	else
		Cite.create!(id: i+1,content: Faker::StarWars.quote, book_id: prng2.rand(1..num_books)  )
		
	end

	
end




#prng.rand(1..num_books)

