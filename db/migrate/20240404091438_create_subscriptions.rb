class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions, id: false do |t|
      t.string :id, primary_key: true
      t.date :start_date
      t.date :end_date
      t.references :user, type: :string, null: false, foreign_key: true

      t.timestamps
    end
  end
end
