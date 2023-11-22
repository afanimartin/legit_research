class CreateReplies < ActiveRecord::Migration[7.0]
  def change
    create_table :replies, id: false do |t|
      t.string :id, primary_key: true
      t.text :content, null: false
      t.references :comment, type: :string, null: false, foreign_key: true

      t.timestamps
    end
  end
end
