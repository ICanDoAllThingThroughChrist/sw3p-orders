class RemoveQuantityFromUsers < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :quantity
  end
end
