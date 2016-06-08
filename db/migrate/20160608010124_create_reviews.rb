class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :sculpture_id
      t.string :comment
      t.integer :rating
      t.string :picture

      t.timestamps

    end
  end
end
