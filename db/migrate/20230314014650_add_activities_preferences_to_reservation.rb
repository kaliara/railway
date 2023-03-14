class AddActivitiesPreferencesToReservation < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :activity_preference_climbing_wall, :integer, default: 1
    add_column :reservations, :activity_preference_swimming_pool, :integer, default: 2
    add_column :reservations, :activity_preference_gokarts, :integer, default: 3
    add_column :reservations, :activity_preference_slipnslide, :integer, default: 4
    add_column :reservations, :activity_preference_paint_night, :integer, default: 5
    add_column :reservations, :activity_preference_archery, :integer, default: 6
    add_column :reservations, :activity_preference_zipline, :integer, default: 7
  end
end
