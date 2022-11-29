class Shelter < ApplicationRecord
  belongs_to :user
  has_many :animals, dependent: :destroy

  has_many_attached :photos
end
