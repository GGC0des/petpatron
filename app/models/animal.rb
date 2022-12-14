class Animal < ApplicationRecord
  belongs_to :shelter
  has_many :emergencies, dependent: :destroy
  has_many :caretakings, dependent: :destroy
  has_many :animal_categories, dependent: :destroy
  has_many :categories, through: :animal_categories
  has_many_attached :photos
  validates_presence_of :name, :description, :sex, :size, :species
  validates_associated :categories

  def append_photos=(attachables)
    photos.attach(attachables)
  end
end
