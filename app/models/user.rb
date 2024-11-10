class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts, dependent: :destroy
  has_many :stories, dependent: :destroy
  has_many :channels, dependent: :destroy
  has_many :messages, dependent: :destroy
  has_many :notifications, foreign_key: :recipient_id, dependent: :destroy

  has_one_attached :avatar

  validates :email, presence: true, uniqueness: true
  validates :password, presence: true, length: { minimum: 6 }, if: :password_required?

  before_save :generate_authentication_token, if: -> { authentication_token.blank? }

  def generate_authentication_token
    self.authentication_token = SecureRandom.hex(20)
  end

  private

  def password_required?
    !persisted? || !password.nil? || !password_confirmation.nil?
  end
end
