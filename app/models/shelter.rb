class Shelter < ApplicationRecord
  belongs_to :user
  has_many :animals, dependent: :destroy
end
