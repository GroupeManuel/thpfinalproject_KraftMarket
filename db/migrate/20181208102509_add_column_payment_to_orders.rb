class AddColumnPaymentToOrders < ActiveRecord::Migration[5.2]
  def change
    add_column :orders, :payment_id, :string
  end
end
