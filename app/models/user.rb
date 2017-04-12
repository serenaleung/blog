class User < ApplicationRecord
  has_many :posts, dependent: :nullify
  has_many :comments

  has_secure_password

  # def first_name
  #   'Jurie'
  # end
end
