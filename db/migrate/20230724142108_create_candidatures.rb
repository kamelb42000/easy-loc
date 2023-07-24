class CreateCandidatures < ActiveRecord::Migration[7.0]
  def change
    create_table :candidatures do |t|
      t.text :content
      t.json :document
      t.string :status, default: "pending"
      t.references :user, null: false, foreign_key: true
      t.references :realty, null: false, foreign_key: true

      t.timestamps
    end
  end
end
