class Story < ApplicationRecord
  belongs_to :user
  has_one_attached :media

  validates :media, presence: true

  def expired?
    Time.current > expires_at
  end
end
