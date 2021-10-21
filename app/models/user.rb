class User < ApplicationRecord
  has_many :reviews, dependent: :destroy
  has_many :restaurants, through: :reviews, dependent: :destroy

  before_save { self.email = email.downcase } 
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

  
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }

  def self.alphabetical_order 
    User.order(email: :asc)
  end

  def self.authenticate(email, submitted_password) 
    user = find_by_email(email)
    return user.nil? ? nil : user
  end

end
