class Category < ApplicationRecord
  has_many :cosmetics, dependent: :destroy
end
