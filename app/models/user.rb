class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: true }
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true

  has_secure_password

end
