class AddGuestOfElyseToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :guest_of_elyse, :boolean, default: true
  end
end
