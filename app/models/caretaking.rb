class Caretaking < ApplicationRecord
  belongs_to :animal
  belongs_to :user

  enum status: [ :pending, :accepted, :declined ]
end
