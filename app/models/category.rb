class Category < ApplicationRecord
  has_many :cosmetics, dependent: :destroy
  validates :name, presence: true
end
