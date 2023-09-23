class CreatePublications < ActiveRecord::Migration[7.0]
  def change
    create_table :publications, id: false do |t|
      t.string :id, primary_key: true
      t.string :title, null: false, default: ""
      t.text :abstract, null: false, default: ""
      t.integer :views, default: 0
      t.text :content, null: false, default: ""
      t.references :user, type: :string, null: false, foreign_key: true

      t.timestamps
    end
  end
end
