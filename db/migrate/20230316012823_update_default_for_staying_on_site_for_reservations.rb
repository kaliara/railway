class UpdateDefaultForStayingOnSiteForReservations < ActiveRecord::Migration[7.0]
  def change
    change_column_default :reservations, :staying_onsite, true
  end
end
