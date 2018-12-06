class ChangeTypeOfAdress < ActiveRecord::Migration[5.2]
  def change
    change_column :orders, :invoice_street, :text
  end
end
