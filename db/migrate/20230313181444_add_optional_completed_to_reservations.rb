class AddOptionalCompletedToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :optional_completed, :boolean, default: false
  end
end
