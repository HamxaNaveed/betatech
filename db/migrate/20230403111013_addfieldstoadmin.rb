class Addfieldstoadmin < ActiveRecord::Migration[7.0]
  def change
    add_column :admins, :first_name, :string
    add_column :admins, :last_name, :string
    add_column :admins, :fb_link, :string
    add_column :admins, :twitter_link, :string
    add_column :admins, :pintrest_link, :string
    add_column :admins, :linkedin, :string

  end
end
