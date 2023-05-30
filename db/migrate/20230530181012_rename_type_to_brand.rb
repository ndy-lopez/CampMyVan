class RenameTypeToBrand < ActiveRecord::Migration[7.0]
  def change
    rename_column :vans, :type, :brand
  end
end
