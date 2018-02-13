class RenameOrdercomment < ActiveRecord::Migration[5.1]
  def change
    rename_table :ordercomment, :ordercomments
  end
end
