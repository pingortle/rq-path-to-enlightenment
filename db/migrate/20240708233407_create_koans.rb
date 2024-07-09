class CreateKoans < ActiveRecord::Migration[7.1]
  def change
    create_table :koans do |t|
      t.string :title
      t.text :description
      t.text :initial_code
      t.integer :order

      t.timestamps
    end
  end
end
