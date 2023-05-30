class AddUserRefToVans < ActiveRecord::Migration[7.0]
  def change
    add_reference :vans, :user, null: false, foreign_key: true
  end
end
