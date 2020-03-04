class User < ApplicationRecord
  has_secure_password
  validates :email, email: true, uniqueness: {case_sensitive: false}
  validates :password, length: { in: 4..100 }
end
