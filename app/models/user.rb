class User < ApplicationRecord
  has_many :posts, dependent: :nullify
  has_many :comments

  has_secure_password
  attr_accessor :current_password

  # Validate current password when the user is updated
 validate :current_password_is_correct, on: :update

 # Check if the inputted current password is correct when the user tries to update his/her password
 def current_password_is_correct
   # Check if the user tried changing his/her password
   if !password.blank?
     # Get a reference to the user since the "authenticate" method always returns false when calling on itself (for some reason)
     user = User.find_by_id(id)

     # Check if the user CANNOT be authenticated with the entered current password
     if (user.authenticate(current_password) == false)
       # Add an error stating that the current password is incorrect
       errors.add(:current_password, "is incorrect.")
     end
   end
 end

  # def first_name
  #   'Jurie'
  # end
end
