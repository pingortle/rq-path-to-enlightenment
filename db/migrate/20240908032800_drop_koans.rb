class DropKoans < ActiveRecord::Migration[7.1]
  def change
    drop_table :koans do |t|
      t.string :title
      t.text :description
      t.text :initial_code
      t.integer :order

      t.timestamps
    end
  end
end
