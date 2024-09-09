module Challengeable
  extend ActiveSupport::Concern

  included do
    has_many :challenges, as: :challengeable, dependent: :destroy
  end

  # Add any common methods or validations for challengeable objects here
end
