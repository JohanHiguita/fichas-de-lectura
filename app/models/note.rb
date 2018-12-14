class Note < ApplicationRecord
  belongs_to :book, optional: true # optional: true solo para correr seeds
  validates :content, presence: true
end
