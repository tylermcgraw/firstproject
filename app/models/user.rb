class User < ActiveRecord::Base
  rolify

  after_save :assign_role

  validate :username, :presence => true
  validate :username, :uniqueness => true

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :comments

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body

  def assign_role
  	add_role :user
  end
end
