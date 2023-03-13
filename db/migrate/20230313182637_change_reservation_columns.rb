class ChangeReservationColumns < ActiveRecord::Migration[7.0]
  def change
    rename_column :reservations, :acommodation_tent, :accommodation_tent
    change_column :reservations, :cabin_own_linens, :string
  end
end
