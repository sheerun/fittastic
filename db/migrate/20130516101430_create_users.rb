class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :email
      t.string :first_name
      t.string :last_name
      t.string :facebook_id
      t.text :facebook_data

      t.timestamps
    end
  end
end
