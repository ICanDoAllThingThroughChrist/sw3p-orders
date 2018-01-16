class RemoveColumnsToUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :image
  	remove_column :users, :uid
  	remove_column :users, :password_digest
  end
end
