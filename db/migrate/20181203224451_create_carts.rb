class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.references :buyer, index: true

      t.timestamps
    end
  end
end
