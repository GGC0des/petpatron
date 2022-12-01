class AnimalCategory < ApplicationRecord
  belongs_to :animal
  belongs_to :category
  validates_uniqueness_of :category, scope: :animal_id
end
