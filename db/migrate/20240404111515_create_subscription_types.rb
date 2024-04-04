class CreateSubscriptionTypes < ActiveRecord::Migration[7.0]
  def change
    create_table :subscription_types do |t|
      t.string :name, null: false
      t.decimal :price, null: false
      t.text :description, null: false

      t.timestamps
    end
  end
end
