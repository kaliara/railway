class AddLinensDisclaimerToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :cabin_linens_disclaimer, :string
  end
end
