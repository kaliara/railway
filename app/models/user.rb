class User < ApplicationRecord
  passwordless_with :email
  has_one :reservation

  validates :email, presence: true, uniqueness: { case_sensitive: false }

  after_create :create_instant_login_token

  def self.fetch_resource_for_passwordless(email)
    find_or_create_by(email: email)
  end

  def create_instant_login_token
    update(instant_login_token: "#{SecureRandom.hex(4)}#{id}")
  end
end
