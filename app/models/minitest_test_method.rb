class MinitestTestMethod < ApplicationRecord
  belongs_to :minitest_test_class
  validates :method_name, presence: true, format: {with: /\A[a-z_]+\z/}
  validates :method_body, presence: true

  def full_code
    <<~CODE
      def test_#{method_name}
      #{indent 2, method_body}
      end
    CODE
  end

  def full_code_with_class
    minitest_test_class.full_code(methods: [self])
  end

  def indent(spaces, code)
    code.split("\n").map { |line| " " * spaces + line }.join("\n")
  end
end
