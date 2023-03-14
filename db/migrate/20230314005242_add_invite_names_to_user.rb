class AddInviteNamesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :invite_names, :string
  end
end
