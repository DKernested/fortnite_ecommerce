class RemoveEmailFromCustomer < ActiveRecord::Migration[6.0]
  def change
    remove_column :customers, :email, :string
  end
end
