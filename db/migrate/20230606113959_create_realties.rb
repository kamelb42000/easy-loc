class CreateRealties < ActiveRecord::Migration[7.0]
  def change
    create_table :realties do |t|
      t.string :name
      t.string :address
      t.string :type
      t.string :rent
      t.date :payment_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
