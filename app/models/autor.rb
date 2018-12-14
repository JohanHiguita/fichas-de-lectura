class Autor < ApplicationRecord
	belongs_to :book, optional: true # optional: true solo para correr seeds
	validates :name1, :lastname1, presence: true

	def name_with_initial
    "#{self.lastname1}, #{self.name1}"
  end
end
