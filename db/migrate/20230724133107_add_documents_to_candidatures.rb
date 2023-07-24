class AddDocumentsToCandidatures < ActiveRecord::Migration[7.0]
  def change
    add_column :candidatures, :documents, :json
  end
end
