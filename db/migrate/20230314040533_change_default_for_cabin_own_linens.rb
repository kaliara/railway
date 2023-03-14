class ChangeDefaultForCabinOwnLinens < ActiveRecord::Migration[7.0]
  def up
    change_column :reservations, :cabin_own_linens, :string, default: 'no'
  end
  def down
    change_column :reservations, :cabin_own_linens, :string, default: 'false'
  end
end
