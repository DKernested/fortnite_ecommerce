class Cosmetic < ApplicationRecord
  # validates :name, :description, :type, :rarity, presence: true
  has_one_attached :image

  belongs_to :category, optional: true

  validates :name, presence: true

  def self.search(search, search_category)
    if search
      Cosmetic.where("name LIKE ? AND category = ?", "%#{search}%", search_category.to_s)
    else
      Cosmetic.all
    end
  end
end
