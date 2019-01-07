class Autor < ApplicationRecord
	belongs_to :book, optional: true # optional: true solo para correr seeds
	validates :name1, :lastname1, presence: true
	before_create :capitalize_fields
	before_update :capitalize_fields

	def name_with_initial
    	"#{self.lastname1}, #{self.name1}"
  	end

  	private

  	def capitalize_fields
		self.name1.capitalize!
		self.name2.capitalize!
		self.lastname1.capitalize!
		self.lastname2.capitalize!
	end

end
