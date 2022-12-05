class Emergency < ApplicationRecord
  belongs_to :animal
  has_many :donations, dependent: :destroy
  validates_presence_of :title, :description, :fundraising_goal

  has_many_attached :photos
end
