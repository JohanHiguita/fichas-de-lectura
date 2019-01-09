class Book < ApplicationRecord
	#Associations:
	has_and_belongs_to_many :topics
	belongs_to :user
	belongs_to :autor
	has_many :cites, dependent: :destroy
	

	#Validation:
	validates :title, presence: true
end
