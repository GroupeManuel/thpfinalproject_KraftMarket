class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.references :seller, index: true
      t.text :description
      t.float :price
      t.belongs_to :category, index: true
      t.belongs_to :cart, index: true
      t.belongs_to :order, index: true
      t.string :status
      
      t.timestamps
      
    end
  end
end
