class Call < ApplicationRecord
  validates :status, presence: true, inclusion: { in: %w[pending active ended] }
  serialize :participants, Array
end
