class Channel < ApplicationRecord
  belongs_to :owner, class_name: 'User'
  has_many :messages, dependent: :destroy

  validates :name, presence: true, uniqueness: true
end
