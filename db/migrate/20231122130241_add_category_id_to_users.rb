class AddCategoryIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :category_id, :string
  end
end
