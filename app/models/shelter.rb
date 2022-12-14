class Shelter < ApplicationRecord
  belongs_to :user
  has_many :animals, dependent: :destroy

  has_many_attached :photos
  validates_uniqueness_of :user_id
  validates_presence_of :name, :description, :location, :phone_number, :email

  geocoded_by :location
  after_validation :geocode, if: :will_save_change_to_location?

  def append_photos=(attachables)
    photos.attach(attachables)
  end
end
