class User < ActiveRecord::Base
  attr_reader :password
  
  has_many(
    :cats,
    class_name: "Cat",
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  has_many(
    :rental_requests,
    class_name: "CatRentalRequest",
    foreign_key: :user_id,
    primary_key: :id,
    dependent: :destroy
  )
  
  has_many(
    :rented_cats,
    through: :rental_requests,
    source: :cat
  )
  
  validates :user_name, :password_digest, :session_token, presence: true
  validates :user_name, :session_token, uniqueness: true
  validates :password, length: { minimum: 6 }, allow_nil: true
  
  after_initialize :ensure_session_token
  
  def self.find_by_credentials(user_name, password)
    found_user = self.find_by(user_name: user_name)
    
    return User.new if found_user.nil?
    
    found_user.is_password?(password) ? found_user : User.new
  end
  
  def ensure_session_token
    self.session_token ||= SecureRandom::urlsafe_base64
  end
 
  def reset_session_token!
    self.session_token = SecureRandom::urlsafe_base64
    self.save!
  end
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    
    # we still need to save this to the database somehow!
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
end
