class Category < ApplicationRecord
  has_many :animal_categories
  has_many :animals, through: :animal_categories
end
