class Channel < ApplicationRecord
  belongs_to :user
  has_many :discussions, dependent: :destroy
  has_many :messages, through: :discussions

  validates :name, presence: true, uniqueness: true
end
