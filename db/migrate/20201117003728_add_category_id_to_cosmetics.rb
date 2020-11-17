class AddCategoryIdToCosmetics < ActiveRecord::Migration[6.0]
  def change
    add_column :cosmetics, :category_id, :integer
  end
end
