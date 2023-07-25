class AddCabinMateNamesToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :cabin_mate_names, :string
  end
end
