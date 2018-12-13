class Cite < ApplicationRecord
  belongs_to :book, optional: true # optional: true solo para correr seeds
end
