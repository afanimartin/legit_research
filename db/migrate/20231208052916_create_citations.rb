class CreateCitations < ActiveRecord::Migration[7.0]
  def change
    create_table :citations, id: false do |t|
      t.string :id, primary_key: true
      t.references :user, null: false, type: :string, foreign_key: true
      t.references :publication, null: false, type: :string, foreign_key: true

      t.timestamps
    end
  end
end
