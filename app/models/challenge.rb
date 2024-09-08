class Challenge < ApplicationRecord
  belongs_to :journey

  delegated_type :challengeable, types: %w[MinitestTestClass]

  validates :title, presence: true
  validates :description, presence: true
  validates :position, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 0}
  validates :challengeable_type, presence: true, inclusion: { in: %w[MinitestTestClass] }

  accepts_nested_attributes_for :challengeable

  def self.new_from_minitest_test_method(record, journey:, position:)
    new(
      title: record.method_name,
      description: record.method_body,
      challengeable: record,
      challengeable_type: record.class.name,
      journey: journey,
      position: position
    )
  end
end
