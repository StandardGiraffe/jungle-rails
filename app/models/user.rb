class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :password, confirmation: true
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: { case_sensitive: false }
  validates :password, length: { minimum: 3 }

  def self.authenticate_with_credentials (email, password)
    user = User.find_by(email: email.strip.downcase)
    if user && user.authenticate(password)
      user
    else
      nil
    end
  end

end
