class Challenge < ApplicationRecord
  belongs_to :journey
  belongs_to :challengeable, polymorphic: true

  def self.new_from_minitest_test_method(record, position:)
    new(
      title: record.method_name,
      description: record.method_body,
      challengeable: record,
      position: position
    )
  end
end
