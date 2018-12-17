class AddSiretInfoToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :company_foundation, :date
    add_column :users, :activity_id, :string
    add_column :users, :job_name, :string
  end
end
