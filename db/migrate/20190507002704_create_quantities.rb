class CreateQuantities < ActiveRecord::Migration[5.1]
  def change
    create_table :quantities do |t|
      t.integer :quantity
      t.integer :item_id
      t.integer :user_id

      t.timestamps
    end
  end
end
