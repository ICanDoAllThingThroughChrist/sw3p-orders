class RemoveCommentsFromOrder < ActiveRecord::Migration[5.1]
  def change
    remove_column(:orders, :comments)
  end
end
