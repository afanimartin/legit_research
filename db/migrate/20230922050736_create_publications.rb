class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications do |t|
      t.string :title, null: false, default: ""
      t.text :abstract, null: false, default: ""
      t.integer :views, default: 0
      t.text :content, null: false, default: ""
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
