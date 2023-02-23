class AddQuestionsToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :attending, :boolean, default: false
    add_column :reservations, :attending_friday, :boolean, default: false
    add_column :reservations, :attending_saturday, :boolean, default: false
    add_column :reservations, :attending_sunday, :boolean, default: false
    add_column :reservations, :staying_onsite, :boolean, default: false
    add_column :reservations, :accommodation_rv, :boolean, default: false
    add_column :reservations, :acommodation_tent, :boolean, default: false
    add_column :reservations, :accommodation_cabin, :boolean, default: false
    add_column :reservations, :accommodation_hotel, :boolean, default: false
    add_column :reservations, :cabin_number, :string
    add_column :reservations, :cabin_mate_request, :string
    add_column :reservations, :cabin_own_linens, :boolean, default: false
    add_column :reservations, :hotel_name, :string
    add_column :reservations, :designated_driver_plan, :boolean, default: false
  end
end
