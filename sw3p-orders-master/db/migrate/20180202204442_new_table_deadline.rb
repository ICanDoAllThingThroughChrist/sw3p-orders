class NewTableDeadline < ActiveRecord::Migration[5.1]
  def change
    create_table :deadlines do |t|
      t.string :deadlines
      t.timestamps
    end
  end
end
