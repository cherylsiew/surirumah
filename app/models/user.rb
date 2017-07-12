
class User < ApplicationRecord

  has_secure_password 

  validates :email, presence: true
  validates :password, presence: true
  validates :password, length: { minimum: 6, message: "must be at least 6 characters" }
  enum roles: [:customer, :moderator, :superadmin]
  has_many :products,:dependent => :destroy
  has_many :purchases, :dependent => :destroy
  
    # def self.authenticate(email, password)
    # user = User.find_by(email)
    # if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
    #   user
    # else
    #   nil
    # end
    # end
    
    # def encrypt_password
    #   if password.present?
    #     self.password_salt = BCrypt::Engine.generate_salt
    #     self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    #   end
    # end

end
