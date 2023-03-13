class AddMealsToReservations < ActiveRecord::Migration[7.0]
  def change
    add_column :reservations, :meal_friday_dinner, :boolean, default: false
    add_column :reservations, :meal_saturday_breakfast, :boolean, default: false
    add_column :reservations, :meal_saturday_lunch, :boolean, default: false
    add_column :reservations, :meal_saturday_dinner, :boolean, default: false
    add_column :reservations, :meal_saturday_snack, :boolean, default: false
    add_column :reservations, :meal_sunday_brunch, :boolean, default: false
  end
end
