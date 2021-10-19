class User < ActiveRecord::Base
  validates :email, uniqueness: { case_sensitive: true }
  validates :email, presence: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :password, length: { minimum: 5 }
  validates :password_confirmation, length: { minimum: 5 }

  has_secure_password

end
