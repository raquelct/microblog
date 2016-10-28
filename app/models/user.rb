class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  # An user has many posts
  has_many :posts, dependent: :destroy
  # Mapping the relationships for Followers and Followeds
  has_many :followings
  has_many :followerships, class_name: 'Following', foreign_key: 'user_id'
  has_many :followedships, class_name: 'Following', foreign_key: 'follower_id'
  has_many :followers, through: :followerships, source: :follower
  has_many :followeds, through: :followedships, source: :user

  attr_accessor :login

  validates :name, presence: true, length: { in: 3..255 }
  # The username is case insensitive, i.e., Caiofct is the same as caiofct
  validates :username, presence: true, uniqueness: {
    :case_sensitive => false
  }, length: { in: 3..255 }

  # Only allow letter, number, underscore and punctuation for the username.
  # Avoid the problem with a username with an email format
  validates_format_of :username, with: /^[a-zA-Z0-9_\.]*$/, multiline: true

  def self.find_for_database_authentication(warden_conditions)
    conditions = warden_conditions.dup
    if login = conditions.delete(:login)
      where(conditions.to_hash).where(["lower(username) = :value OR lower(email) = :value", { :value => login.downcase }]).first
    elsif conditions.has_key?(:username) || conditions.has_key?(:email)
      conditions[:email].dup.downcase! if conditions[:email]
      conditions[:username].dup.downcase! if conditions[:username]
      where(conditions.to_hash).first
    end
  end
end
