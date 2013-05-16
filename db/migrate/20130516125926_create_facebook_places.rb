class CreateFacebookPlaces < ActiveRecord::Migration
  def change
    create_table :facebook_places do |t|
      t.string :facebook_id
      t.string :facebook_name

      t.timestamps
    end
  end
end
