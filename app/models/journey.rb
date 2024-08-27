class Journey < ApplicationRecord
  has_many :challenges, dependent: :destroy

  def self.new_from_minitest_test_class(record)
    new(
      title: record.title,
      description: record.description,
      challenges: record.minitest_test_methods.map { |method|
        Challenge.new_from_minitest_test_method(method, position: method.position.to_i)
      }
    )
  end
end
