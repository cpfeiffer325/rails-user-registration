class ChangeEmailConfirmedToTrue < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :email_confirmed, true
  end
end
