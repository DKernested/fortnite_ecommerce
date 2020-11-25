class AddPriceToCosmetics < ActiveRecord::Migration[6.0]
  def change
    add_column :cosmetics, :price, :integer
  end
end
