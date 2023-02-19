class User < ApplicationRecord
  passwordless_with :email
  has_one :reservation

  validates :email, presence: true, uniqueness: { case_sensitive: false }
end
