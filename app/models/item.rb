class Item < ApplicationRecord
  validates :name, :rarity, :price, presence: true
  has_one_attached :image
end
