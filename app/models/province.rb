class Province < ApplicationRecord
  has_many :customers, dependent: :destroy
  validates :name, :pst_rate, presence: true
end
