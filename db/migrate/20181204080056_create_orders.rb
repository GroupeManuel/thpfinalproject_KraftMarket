class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :buyer, index: true
      t.references :item, index: true
      t.integer :price
      t.string :status
      t.string :delivery_method
      t.string :delivery_entity
      t.string :delivery_street
      t.string :delivery_street2
      t.string :delivery_postcode
      t.string :delivery_city
      t.string :delivery_country
      t.string :delivery_state
      t.string :delivery_instructions
      t.string :invoice_entity
      t.string :invoice_street
      t.string :invoice_street2
      t.string :invoice_postcode
      t.string :invoice_city
      t.string :invoice_country
      t.string :invoice_state
      t.timestamps
    end
  end
end
