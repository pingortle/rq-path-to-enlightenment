class Journey < ApplicationRecord
  has_many :challenges, -> { order(position: :asc) }, dependent: :destroy

  validates :title, presence: true

  def name
    # TODO: Implement actual name logic
    "Journey #{id}"
  end

  def completion_percentage
    # TODO: Implement actual completion percentage calculation
    @completion_percentage ||= rand(0..100) # Returning a random percentage as a stub
  end

  def self.new_from_minitest_test_class(record)
    new(
      title: record.title,
      description: record.description,
      challenges: record.minitest_test_methods.map.with_index { |method, index|
        Challenge.new_from_minitest_test_method(method, position: index)
      }
    )
  end
end
