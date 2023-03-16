class AddCamperToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :accommodation_camper, :boolean, default: false
  end
end
