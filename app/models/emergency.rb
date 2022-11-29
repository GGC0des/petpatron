class Emergency < ApplicationRecord
  belongs_to :animal
  has_many :donations, dependent: :destroy
end
