class CreateExpiredSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :expired_subscriptions do |t|
      t.string :user_id
      t.date :start_date
      t.date :end_date
      t.integer :subscription_days
      t.boolean :approved
      t.datetime :subscription_created
      t.datetime :subscription_updated
      t.string :subscription_type

      t.timestamps
    end
  end
end
