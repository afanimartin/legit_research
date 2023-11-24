class AddDateOfBirthToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :date_of_birth, :date, null: false
  end
end
