class CreateActivities < ActiveRecord::Migration
  def change
    create_table :activities do |t|
      t.integer :user_id
      t.string :description
      t.integer :facebook_place_id

      t.timestamps
    end
  end
end
