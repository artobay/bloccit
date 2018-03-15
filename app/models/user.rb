class User < ApplicationRecord
#object before saving , refers to email object 
 before_save { self.email = email.downcase if email.present? }

 # #3 Name Validation 
   validates :name, length: { minimum: 1, maximum: 100 }, presence: true
 
 # #4 Note: We validate password in two separate validations -->first password_digest should be nil 
 # Note: allow_blank skips the validation if no updated password is given. 
  validates :password, presence: true, length: { minimum: 6 }, if: "password_digest.nil?"
  validates :password, length: { minimum: 6 }, allow_blank: true

 # #5 validate email
   validates :email,
             presence: true,
             uniqueness: { case_sensitive: false },
             length: { minimum: 3, maximum: 254 }
     #6 Read about this         
      has_secure_password       
end
