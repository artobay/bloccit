class User < ApplicationRecord
 has_many :posts, dependent: :destroy
 has_many :comments, dependent: :destroy
 has_many :votes, dependent: :destroy
 has_many :favorites, dependent: :destroy
 
 before_save { self.email = email.downcase if email.present? }
 before_save {self.role ||= :member}
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
            
      has_secure_password    
      
      enum role: [:member, :admin]
      
       def favorite_for(post)
       favorites.where(post_id: post.id).first
       end
       
       def avatar_url(size)
     gravatar_id = Digest::MD5::hexdigest(self.email).downcase
     "http://gravatar.com/avatar/#{gravatar_id}.png?s=#{size}"
       end

end
