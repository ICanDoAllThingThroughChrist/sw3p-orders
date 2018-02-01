class RenameOrdersComments < ActiveRecord::Migration[5.1]
  def change
    rename_table :orders_comments, :ordercomment
  end
end
