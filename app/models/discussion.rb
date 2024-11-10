class Discussion < ApplicationRecord
  belongs_to :channel
  belongs_to :user
  has_many :messages, dependent: :destroy

  validates :title, presence: true
end
