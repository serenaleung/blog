class User < ApplicationRecord
  has_many :posts, dependent: :nullify
  has_many :comments
  
  has_secure_password
end
