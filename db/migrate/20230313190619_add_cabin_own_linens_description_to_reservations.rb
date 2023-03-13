class AddCabinOwnLinensDescriptionToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :cabin_own_linens_description, :string
  end
end
