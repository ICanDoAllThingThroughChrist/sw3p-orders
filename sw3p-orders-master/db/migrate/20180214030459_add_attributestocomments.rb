class AddAttributestocomments < ActiveRecord::Migration[5.1]
  def change
    add_column :comments, :task, :string
    add_column :comments, :deadline, :string
  end
end
