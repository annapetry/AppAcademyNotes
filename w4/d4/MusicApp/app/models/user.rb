# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  username        :string(255)      not null
#  password_digest :string(255)      not null
#  session_token   :string(255)      not null
#  created_at      :datetime
#  updated_at      :datetime
#

class User < ActiveRecord::Base
  attr_reader :password

  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :session_token, presence: true, uniqueness: true

  validates :password, length: { minimum: 6, allow_nil: true }

  after_initialize :ensure_session_token

  has_many(
    :notes,
    class_name: "Note",
    foreign_key: :user_id,
    primary_key: :id
  )

  def ensure_session_token
    self.session_token ||= User.generate_session_token
  end

  def reset_session_token!
    self.session_token = User.generate_session_token
    self.save!
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end

  def self.find_by_credentials(username, password)
      found_user = self.find_by(username: username)

      return nil if found_user.nil?

      found_user.is_password?(password) ? found_user : nil
  end

  private
  def self.generate_session_token
    SecureRandom::urlsafe_base64
  end
end
