class AddFacebookDataToUsers < ActiveRecord::Migration
  def change
    add_column :users, :facebook_id, :string
    add_column :users, :facebook_token, :string
    add_column :users, :facebook_data, :text
  end
end
