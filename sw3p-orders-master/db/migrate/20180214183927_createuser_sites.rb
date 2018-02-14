class CreateuserSites < ActiveRecord::Migration[5.1]
  def change
    create_table :user_sites do |t|
      t.integer :user_id
      t.integer :site_id
    end
  end
end
