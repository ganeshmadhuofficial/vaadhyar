class DeviseTokenAuthCreateUsers < ActiveRecord::Migration
  def change
    create_table(:users) do |t|
      ## Required
      t.string :provider, null: false, default: "email"
      t.string :uid,      null: false, default: ""

      ## Database authenticatable
      t.string :encrypted_password, null: false, default: ""

      ## Recoverable
      # t.string   :reset_password_token
      # t.datetime :reset_password_sent_at

      ## Rememberable
      # t.datetime :remember_created_at

      ## Trackable
      # t.integer  :sign_in_count, default: 0, null: false
      # t.datetime :current_sign_in_at
      # t.datetime :last_sign_in_at
      # t.string   :current_sign_in_ip
      # t.string   :last_sign_in_ip

      ## Confirmable
      # t.string   :confirmation_token
      # t.datetime :confirmed_at
      # t.datetime :confirmation_sent_at
      # t.string   :unconfirmed_email # Only if using reconfirmable

      ## Lockable
      # t.integer  :failed_attempts, :default => 0, :null => false # Only if lock strategy is :failed_attempts
      # t.string   :unlock_token # Only if unlock strategy is :email or :both
      # t.datetime :locked_at

      ## User Info
      t.string  :email,          null: false
      t.string  :first_name,     null: false
      t.string  :last_name
      t.column  :phone_number,   :bigint,        null: false
      t.integer :age,            null: false
      t.integer :experience,     null: false
      t.boolean :is_admin,       default: false
      t.boolean :is_vaadhyar,    default: false
      t.string  :state
      t.string  :city
      t.string  :region
      t.float   :latitude
      t.float   :longitude
      t.text    :vedam,          array: true
      t.text    :classification, array: true

      ## Tokens
      t.json :tokens

      t.timestamps
    end

    add_index :users, :email,                unique: true
    add_index :users, [:uid, :provider],     unique: true
    add_index :users, :is_vaadhyar
    add_index :users, :city
    add_index :users, :region
    add_index :users, :latitude
    add_index :users, :longitude
    add_index :users, :vedam
    add_index :users, :classification
  end
end
