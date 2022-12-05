class Caretaking < ApplicationRecord
  belongs_to :animal
  belongs_to :user
  belongs_to :category

  enum status: [ :pending, :accepted, :declined ]
  validates_presence_of :date
end
