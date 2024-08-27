class CreateChallenges < ActiveRecord::Migration[7.1]
  def change
    create_table :challenges do |t|
      t.string :title
      t.text :description
      t.integer :position
      t.references :journey, null: false, foreign_key: true
      t.references :challengeable, polymorphic: true, null: false

      t.timestamps
    end
  end
end
