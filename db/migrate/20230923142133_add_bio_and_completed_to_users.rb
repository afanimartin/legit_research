class AddBioAndCompletedToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :bio, :text, null: false, default: ""
    add_column :users, :completed, :boolean, null: false, default: false
  end
end
