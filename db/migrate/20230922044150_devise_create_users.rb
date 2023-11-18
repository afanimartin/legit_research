class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      ## Custom columns
      t.string :id, primary_key: true
      t.string :full_name
      t.string :avatar_url
      t.string :provider
      t.string :plan, null: false, default: "free"

      ## Database authenticatable
      t.string :email,              null: false, default: ""         
      t.string :encrypted_password, null: false, default: ""

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
