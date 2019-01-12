class Book < ApplicationRecord
	#Associations:
	has_and_belongs_to_many :topics
	belongs_to :user
	belongs_to :autor
	has_many :cites, dependent: :destroy
	before_create :downcase_fields
	before_update :downcase_fields
	
	#Validation:
	validates :title, presence: true

	private

  	def downcase_fields
		self.title.downcase!
		self.editorial.downcase!
		self.city.downcase!
		
	end
end
