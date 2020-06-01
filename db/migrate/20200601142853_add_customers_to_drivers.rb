class AddCustomersToDrivers < ActiveRecord::Migration[5.0]
  def change
  	create_table :customers_drivers, id: false do |t|
      t.belongs_to :customer
      t.belongs_to :driver
    end
  end
end
