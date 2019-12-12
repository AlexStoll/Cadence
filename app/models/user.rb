class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name,  presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /[^@]+@[^\.]+\..+/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: true
  has_secure_password

  # Using the strong_password gem. https://www.github.com/bdmac/strong_password
  validates :password, password_strength: { min_entropy: 10 }
end
