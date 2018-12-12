class AddFakerimageToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :Faker_image, :string
  end
end
