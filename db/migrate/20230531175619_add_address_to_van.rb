class AddAddressToVan < ActiveRecord::Migration[7.0]
  def change
    add_column :vans, :address, :string
  end
end
