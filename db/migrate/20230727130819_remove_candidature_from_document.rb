class RemoveCandidatureFromDocument < ActiveRecord::Migration[7.0]
  def change
    remove_reference :documents, :candidature, null: false, foreign_key: true
  end
end
