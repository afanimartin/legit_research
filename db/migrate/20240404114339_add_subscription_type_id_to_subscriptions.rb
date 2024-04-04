class AddSubscriptionTypeIdToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_reference :subscriptions, :subscription_type, null: false, foreign_key: true
  end
end
