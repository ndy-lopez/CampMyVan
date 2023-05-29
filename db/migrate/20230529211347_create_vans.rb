class CreateVans < ActiveRecord::Migration[7.0]
  def change
    create_table :vans do |t|
      t.string :type
      t.string :model
      t.integer :price

      t.timestamps
    end
  end
end
