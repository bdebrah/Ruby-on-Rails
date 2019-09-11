class CreateItemsUsersJoinTable < ActiveRecord::Migration[5.1]
  def change
    create_table :restaurants_users, id: false do |t|
      t.belongs_to :restaurant
      t.belongs_to :user
    end
  end
end