class CreateMinitestTestMethods < ActiveRecord::Migration[7.1]
  def change
    create_table :minitest_test_methods do |t|
      t.string :method_name
      t.text :method_body
      t.references :minitest_test_class, null: false, foreign_key: true

      t.timestamps
    end
  end
end
