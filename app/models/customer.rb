class Customer < ApplicationRecord
  validates :name, :email, :password, presence: true
  has_one_attached :image
end
