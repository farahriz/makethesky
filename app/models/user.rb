class User < ApplicationRecord
  has_secure_password
  has_many :scarves, dependent: :destroy

  validates :password, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: /@.+\...+/}
  
end
