class AddGravatarUrlToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :gravatar_url, :string
  end
end
