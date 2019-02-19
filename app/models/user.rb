class User < ApplicationRecord
  has_secure_password
  has_many :scarves

  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: /@.+\...+/}
  
end
