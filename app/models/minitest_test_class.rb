class MinitestTestClass < ApplicationRecord
  include Formattable

  has_many :minitest_test_methods, dependent: :destroy
  validates :class_name, presence: true, format: {with: /\A[A-Z][a-zA-Z]*\z/}

  def full_code(methods: minitest_test_methods)
    <<~CODE
      class #{class_name} < Minitest::Test
      #{indent 2, methods.map(&:full_code).join("\n")}
      end
    CODE
  end

  def title
    class_name
  end

  def description
    "TODO: Write a description for #{class_name}"
  end
end
