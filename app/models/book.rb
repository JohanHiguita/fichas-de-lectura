class Book < ApplicationRecord
	has_and_belongs_to_many :topics
	belongs_to :user
	belongs_to :autor
	has_many :cites, dependent: :destroy
	has_many :notes, dependent: :destroy
end
