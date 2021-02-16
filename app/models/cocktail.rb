class Cocktail < ApplicationRecord
  has_many :doses, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :ingredients, through: :doses
  has_one_attached :photo

  validates :name, presence: true, length: { in: 5..25 }
  validates :description, presence: true, length: { in: 5..255 }

  validates_associated :doses
  validates_associated :reviews
  validates_associated :ingredients
end
