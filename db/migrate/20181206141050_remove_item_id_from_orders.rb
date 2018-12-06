class RemoveItemIdFromOrders < ActiveRecord::Migration[5.2]
  def change
    remove_reference :orders, :item, index: true
  end
end
