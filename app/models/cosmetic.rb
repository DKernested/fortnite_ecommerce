class Cosmetic < ApplicationRecord
  # validates :name, :description, :type, :rarity, presence: true
  has_one_attached :image
end
