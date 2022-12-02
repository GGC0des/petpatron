class Shelter < ApplicationRecord
  belongs_to :user
  has_many :animals, dependent: :destroy

  has_many_attached :photos
  validates_uniqueness_of :user_id

  def append_photos=(attachables)
    photos.attach(attachables)
  end
end
