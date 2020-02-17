class User < ApplicationRecord
  validates :username, :session_token, presence: true, uniqueness: true
  validates :password_digest, presence: { message: "cannot be blank" }
  validates :password, length: { minimum: 6 }, allow_nil: true
  before_validation :ensure_session_token

  attr_reader :password

  has_many :cats, 
    foreign_key: :user_id, 
    class_name: :Cat 

  has_many :requests,
    foreign_key: :user_id,
    class_name: :CatRentalRequest

  def ensure_session_token
    self.session_token ||= SecureRandom.urlsafe_base64(16)
  end

  def self.find_by_credentials(user_name, password) 
    user = User.find_by(username: user_name)
    user && user.is_password?(password) ? user : nil
  end 

  def reset_session_token!
    self.update!(session_token: SecureRandom.urlsafe_base64(16))
    self.session_token
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
