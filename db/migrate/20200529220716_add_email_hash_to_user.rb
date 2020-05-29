class AddEmailHashToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :email_hash, :text
  end
end
