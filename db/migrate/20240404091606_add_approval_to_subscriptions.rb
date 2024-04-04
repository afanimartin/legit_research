class AddApprovalToSubscriptions < ActiveRecord::Migration[7.0]
  def change
    add_column :subscriptions, :approved, :boolean, default: false
  end
end
