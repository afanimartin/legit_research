class RemoveCategoryIdFromUsers < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :category_id, :string
  end
end
