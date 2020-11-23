class AddProvinceToCustomers < ActiveRecord::Migration[6.0]
  def change
    add_column :customers, :province_id, :integer
  end
end
