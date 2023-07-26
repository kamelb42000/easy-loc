class AddCandidatureToDocuments < ActiveRecord::Migration[7.0]
  def change
    add_reference :documents, :candidature, foreign_key: true
  end
end
