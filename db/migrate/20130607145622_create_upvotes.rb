class CreateUpvotes < ActiveRecord::Migration
  def change
    create_table :upvotes do |t|
      t.integer :user_id
      t.integer :activity_id
      t.decimal :value

      t.timestamps
    end
  end
end
