class AddStatusIdToPublications < ActiveRecord::Migration[7.0]
  def change
    add_reference :publications, :status, null: false, foreign_key: true
  end
end
