class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_one :shelter, dependent: :destroy
  has_many :animals, through: :shelter, dependent: :destroy
  has_many :donations, dependent: :destroy
  has_many :caretakings, dependent: :destroy
end
