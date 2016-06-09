class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates :email, presence: true
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true

  has_many :reviews, :class_name => "Review", :foreign_key =>"user_id"
  has_many :liked_sculptures, :through => :reviews, :source => :sculptures

end
