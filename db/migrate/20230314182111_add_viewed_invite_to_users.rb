class AddViewedInviteToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :viewed_invite, :boolean, default: false
  end
end
