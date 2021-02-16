class Ingredient < ApplicationRecord
  has_many :doses
  has_many :cocktails, through: :doses

  validates_associated :doses
  validates_associated :cocktails

  validates :name, presence: true, length: { in: 3..30 }
end
