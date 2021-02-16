class Review < ApplicationRecord
  belongs_to :cocktail

  before_validation :set_username
  validates :content, presence: true, length: { in: 5..255 }
  validates :username, presence: true, length: { in: 3..25 }
  validates :rate, numericality: { only_integer: true,
                                   less_than_or_equal_to: 5,
                                   greater_than_or_equal_to: 0 }

  def set_username
    return unless username.blank?

    self.username = 'Anonymous'
  end
end
