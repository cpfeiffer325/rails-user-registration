class RemoveColumn < ActiveRecord::Migration[6.0]
  def change
    remove_column :users, :gravatar_url, :string
  end
end
