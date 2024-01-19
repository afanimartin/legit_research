class RemoveCategoryFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :category, :string
  end
end
