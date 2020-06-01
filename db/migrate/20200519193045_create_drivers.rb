class CreateDrivers < ActiveRecord::Migration[5.0]
  def change
    create_table :drivers do |t|
      t.string :first_name
      t.string :last_name
      t.integer :phone
      t.string :email
      t.references :customer, foreign_key: true

      t.timestamps
    end
  end
end
