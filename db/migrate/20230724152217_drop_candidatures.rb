class DropCandidatures < ActiveRecord::Migration[7.0]
  def change
    drop_table :candidatures
  end
end
