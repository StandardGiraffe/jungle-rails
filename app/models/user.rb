class User < ActiveRecord::Base

  has_secure_password
  has_many :reviews

  validates :password, confirmation: true
  validates :first_name, :last_name, :email, :password, presence: true
  validates :email, uniqueness: true
  validates :password, length: { minimum: 3 }

end
