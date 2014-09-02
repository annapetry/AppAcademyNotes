class User < ActiveRecord::Base
  validates :username, presence: true
  validates :password, length: { minimum: 6, allow_nil: true }

  has_many(
    :goals,
    class_name: "Goal",
    foreign_key: :user_id,
    primary_key: :id
  )

  
  after_initialize :ensure_session_token
  
  attr_reader :password

  #class methods
  
  def self.find_by_credentials(username, password)
    user = User.find_by(username: username)
    
    return nil if user.nil?
    
    user.is_password?(password) ? user : nil
  end
  
  def self.generate_token
    SecureRandom::urlsafe_base64
  end
  
  #instance methods
  def password=(password)
    # return nil unless password.present?
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def ensure_session_token
    self.session_token ||= self.class.generate_token
  end
  
  def reset_session_token!
    self.session_token = self.class.generate_token
    self.save!
    self.session_token
  end
end
