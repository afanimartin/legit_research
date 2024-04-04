class AddSubscriptionDaysToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :subscription_days, :integer, default: 0
  end
end
