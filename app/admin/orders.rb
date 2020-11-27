ActiveAdmin.register Order do
  permit_params :payment_id, :cosmetic_id, :customer_id, :province_id, :cosmetic_cost, :tax_cost, :total_cost, :order_status
end
