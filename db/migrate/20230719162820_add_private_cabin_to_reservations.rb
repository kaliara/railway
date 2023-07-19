class AddPrivateCabinToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :private_cabin, :boolean, default: false
  end
end
