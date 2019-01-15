class Topic < ApplicationRecord
	has_and_belongs_to_many :books
	belongs_to :user
	validates :name, presence: true
end
