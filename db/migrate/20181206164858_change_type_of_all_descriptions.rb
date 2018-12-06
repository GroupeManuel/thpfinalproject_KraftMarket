class ChangeTypeOfAllDescriptions < ActiveRecord::Migration[5.2]
  	def change
  	    change_column :orders, :delivery_instructions, :text
  	    change_column :users, :delivery_instructions, :text
  	    change_column :users, :company_description, :text
  	end
end
