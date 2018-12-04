# frozen_string_literal: true

class DeviseCreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      ## Database authenticatable
      t.string :email,              null: false, default: ""
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      t.string   :reset_password_token
      t.datetime :reset_password_sent_at

      ## Rememberable
      t.datetime :remember_created_at

      ## Trackable
      t.integer  :sign_in_count, default: 0, null: false
      t.datetime :current_sign_in_at
      t.datetime :last_sign_in_at
      t.inet     :current_sign_in_ip
      t.inet     :last_sign_in_ip

      ## Confirmable
      t.string   :confirmation_token
      t.datetime :confirmed_at
      t.datetime :confirmation_sent_at
      t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, default: 0, null: false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      # Personal Informations
      t.string :first_name
      t.string :last_name
      t.string :phone_number
      t.string :activity
      t.string :company_name
      t.string :company_ID_number
      t.text :personal_description
      t.string :company_description
      t.boolean :is_buyer
      t.boolean :is_seller
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


      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
    add_index :users, :reset_password_token, unique: true
    # add_index :users, :confirmation_token,   unique: true
    # add_index :users, :unlock_token,         unique: true
  end
end
