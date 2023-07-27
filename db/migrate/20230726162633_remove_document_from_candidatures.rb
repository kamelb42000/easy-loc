class RemoveDocumentFromCandidatures < ActiveRecord::Migration[7.0]
  def change
    remove_column :candidatures, :document, :json
  end
end
