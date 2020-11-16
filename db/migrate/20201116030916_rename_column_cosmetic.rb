class RenameColumnCosmetic < ActiveRecord::Migration[6.0]
  def change
    rename_column :cosmetics, :type, :item_type
  end
end
