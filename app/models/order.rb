class Order < ApplicationRecord
  belongs_to :customer
  has_one :province, dependent: :destroy
  has_one :cosmetic, dependent: :destroy
end
