class Animal < ApplicationRecord
  belongs_to :shelter
  has_one :emergency, dependent: :destroy
  has_many :caretakings, dependent: :destroy
end
