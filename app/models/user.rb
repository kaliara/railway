class User < ApplicationRecord
  passwordless_with :email
  has_one :reservation

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  def self.fetch_resource_for_passwordless(email)
    find_or_create_by(email: email)
  end
end
