class User < ApplicationRecord
  has_secure_password(validations: false)

  enum role: [ :superadmin, :standard ]

  has_many :scarves, dependent: :destroy

  validates :password_digest, presence: true
  validates :email, presence: true, uniqueness: true
  validates :email, format: {with: /@.+\...+/}
  
end
