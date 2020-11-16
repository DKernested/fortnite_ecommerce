class CreateCosmetics < ActiveRecord::Migration[6.0]
  def change
    create_table :cosmetics do |t|
      t.string :name
      t.string :description
      t.string :type
      t.string :rarity
      t.string :image

      t.timestamps
    end
  end
end
