class User < ApplicationRecord
  has_secure_password

  validates :uuid, :email, presence: true, uniqueness: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  has_many :sleep_sessions, dependent: :destroy
  has_many :activity_sessions, dependent: :destroy
end
