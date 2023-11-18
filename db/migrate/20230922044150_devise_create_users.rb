class DeviseCreateUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :users, id: false do |t|
      t.string :id, primary_key: true
      t.string :email, null: false
      t.string :name, null: false
      t.text :bio, default: ""
      t.boolean :completed, null: false, default: false
      t.string :plan, null: false, default: "free"

      t.timestamps null: false
    end

    add_index :users, :email,                unique: true
  end
end
