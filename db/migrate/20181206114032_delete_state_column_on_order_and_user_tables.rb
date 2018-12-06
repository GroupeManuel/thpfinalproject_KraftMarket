class DeleteStateColumnOnOrderAndUserTables < ActiveRecord::Migration[5.2]
  def change
    remove_column :orders, :invoice_state
    remove_column :orders, :delivery_state
    remove_column :users, :invoice_state
    remove_column :users, :delivery_state
  end
end
