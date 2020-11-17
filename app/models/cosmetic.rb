class Cosmetic < ApplicationRecord
  # validates :name, :description, :type, :rarity, presence: true
  has_one_attached :image

  belongs_to :category, optional: true

  validates :name, presence: true

  def self.search(search)
    if search
      Cosmetic.where("name LIKE ? OR description LIKE ?", "%#{search}", "%#{search}")
    else
      Cosmetic.all
    end
  end
end
