class AnimalCategory < ApplicationRecord
  belongs_to :animal
  belongs_to :category
end
