class AddUserIdsToItems < ActiveRecord::Migration[5.1]
  def change
    add_column :items, :user_ids, :integer, array: true, default: []
  end
end
