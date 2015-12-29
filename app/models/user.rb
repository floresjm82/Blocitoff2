class User < ActiveRecord::Base

  has_many :items, dependent: :destroy

  # Include default devise modules. Others available are:
  # :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :confirmable, :lockable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :name, presence: true, length: {maximum 50}
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i 
  validates :email, format: {with: VALID_EMAIL_REGEX}, uniqueness: {case_sensitive:false}
  validates :password, presence: true, length: {minimum 8}, if: "password_digest.nil?"

  has_secure_password

end
