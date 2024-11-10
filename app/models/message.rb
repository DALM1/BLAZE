class Message < ApplicationRecord
  belongs_to :discussion
  belongs_to :channel
  belongs_to :user

  validates :content, presence: true
end
