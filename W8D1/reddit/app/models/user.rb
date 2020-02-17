class User < ApplicationRecord
    validates :username, :session_token, :password_digest, presence: true
    validates :username, :session_token, uniqueness: true 
    validates :password, length: {minimum: 8}, allow_nil: true
    after_initialize :ensure_session_token

    attr_reader :password

    has_many :subs, 
        foreign_key: :moderator_id,
        class_name: :Sub

    has_many :posts, 
        foreign_key: :author_id,
        class_name: :Post

    has_many :comments, 
        foreign_key: :author_id, 
        class_name: :Comment
        
    def self.find_by_credentials(username, password)
        @user = User.find_by(username: username)
        @user && @user.is_password?(password) ? @user : nil 
    end

    def password=(password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password
    end

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token!
        self.session_token = SecureRandom.urlsafe_base64(16)
        self.save 
        self.session_token
    end 

    def ensure_session_token
        self.session_token ||= SecureRandom.urlsafe_base64(16)
    end
    
end
