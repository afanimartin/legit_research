class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments, id: false do |t|
      t.string :id, primary_key: true
      t.string :content
      t.references :user, null: false, foreign_key: true
      t.references :publication, type: :string, null: false, foreign_key: true

      t.timestamps
    end
  end
end
