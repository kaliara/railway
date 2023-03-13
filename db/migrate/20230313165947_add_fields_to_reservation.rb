class AddFieldsToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :food_allergies, :string
    add_column :reservations, :dietary_preferences, :string
    add_column :reservations, :additional_comments, :string
    add_column :reservations, :guest_names, :string
  end
end
