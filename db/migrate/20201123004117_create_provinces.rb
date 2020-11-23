class CreateProvinces < ActiveRecord::Migration[6.0]
  def change
    create_table :provinces do |t|
      t.timestamps
      t.string :name
      t.decimal :pst_rate
    end
  end
end
