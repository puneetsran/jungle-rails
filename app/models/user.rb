class User < ActiveRecord::Base
  has_secure_password
  validates: email, uniqueness: {case_sensitive: false}, presence: true
  validates: name, presence: true
  validates: password, length: { in: 6..15}, presence: true
  validates: password_confirmation, presence: true
  
  def self.authenticate_with_credentials(email, password)
    user = User.find_by_email(email.downcase.strip)
    if user && user.authenticate(password)
      user
    else
      nil
  end
end
