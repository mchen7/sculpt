class CreateSculptures < ActiveRecord::Migration
  def change
    create_table :sculptures do |t|
      t.float :lng
      t.float :lat
      t.string :city
      t.string :description
      t.float :aggregate
      t.string :name
      t.string :address
      t.string :state
      t.integer :zipcode

      t.timestamps

    end
  end
end
