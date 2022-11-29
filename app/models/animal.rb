class Animal < ApplicationRecord
  belongs_to :shelter
  has_one :emergency, dependent: :destroy
  has_many :caretakings, dependent: :destroy

  has_many_attached :photos
end
