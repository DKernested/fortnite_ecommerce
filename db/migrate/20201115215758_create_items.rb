class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name
      t.integer :category_id
      t.string :rarity
      t.decimal :price

      t.timestamps
    end
  end
end
