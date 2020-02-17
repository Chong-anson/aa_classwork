# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  email           :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  password_digest :string           not null
#  session_token   :string           not null
#

class User < ApplicationRecord
  before_validation :ensure_session_token 

  validates :email, presence: true, uniqueness: true 
  #validates for unqiueness for the email, INSTEAD OF the index 
  #index allow fast lookup only 
  validates :password_digest, presence: {message: "Password cannot be blank!"}
  validates :password, length: {minimum: 6, allow_nil: true }

  attr_reader :password

  def self.generate_session_token 
    SecureRandom::urlsafe_base64(16)
  end 

  def self.find_by_credentials(email, password)
     user = User.find_by(email: email)
     user && user.is_password?(password) ? user : nil 
     #user get evaluated first 
     #if there is no user, it will return before the 2nd statement is evaluated 
  end

  def reset_session_token!
    self.session_token = User.generate_session_token 
    self.save!
    #save! should be used 
    self.session_token
  end

  def ensure_session_token 
    self.session_token ||= User.generate_session_token
  end
   
  def password=(password)
    @password = password 
    self.password_digest = BCrypt::Password.create(password)
  end 

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
