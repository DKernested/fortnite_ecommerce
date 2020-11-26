class ChangesToProvinceTable < ActiveRecord::Migration[6.0]
  def change
    rename_column :provinces, :gst_rate, :gst_hst_rate
    remove_column :provinces, :hst_rate, :decimal
  end
end
