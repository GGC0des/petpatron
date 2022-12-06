class Animal < ApplicationRecord
  belongs_to :shelter
  has_many :emergencies, dependent: :destroy
  has_many :caretakings, dependent: :destroy
  has_many :animal_categories, dependent: :destroy
  has_many :categories, through: :animal_categories
  has_many_attached :photos

  def append_photos=(attachables)
    photos.attach(attachables)
  end
end
