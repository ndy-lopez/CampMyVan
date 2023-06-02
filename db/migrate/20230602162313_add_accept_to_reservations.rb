class AddAcceptToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :accept, :boolean
  end
end
