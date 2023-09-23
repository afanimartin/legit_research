class AddCategoryIdToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :category, type: :string, null: false, foreign_key: true
  end
end
