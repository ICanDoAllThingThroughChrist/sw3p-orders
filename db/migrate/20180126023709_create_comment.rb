class CreateComment < ActiveRecord::Migration[5.1]
  def change
    create_table :comments do |t|
      t.string :comment
      t.integer :order_id
      t.timestamps
    end
  end
end
