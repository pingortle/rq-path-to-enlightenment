class CreateMinitestTestClasses < ActiveRecord::Migration[7.1]
  def change
    create_table :minitest_test_classes do |t|
      t.string :class_name

      t.timestamps
    end
  end
end
