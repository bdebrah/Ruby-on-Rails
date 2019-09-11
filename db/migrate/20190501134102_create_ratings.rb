class CreateRatings < ActiveRecord::Migration[5.1]
  def change
    create_table :ratings do |t|
      t.float :ratings
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
  end
end
