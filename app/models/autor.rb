class Autor < ApplicationRecord
	belongs_to :book, optional: true # optional: true solo para correr seeds
	validates :name1, :lastname1, presence: true
end
