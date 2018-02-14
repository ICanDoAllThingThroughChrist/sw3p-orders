class AddSiteIDtoUsers < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :site_id, :integer
  end
end
