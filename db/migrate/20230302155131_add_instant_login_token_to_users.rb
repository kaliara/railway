class AddInstantLoginTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :instant_login_token, :string
  end
end
