class Cosmetic < ApplicationRecord
  # validates :name, :description, :type, :rarity, presence: true
  has_one_attached :image

  def self.search(search)
    if search
      Cosmetic.where("name OR description LIKE ?", "%#{search}")
    else
      Cosmetic.all
    end
  end
end
