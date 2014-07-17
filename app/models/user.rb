class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :role, :user_name, :available
  # attr_accessible :title, :body
  
  has_many :projects, foreign_key: "manager_id"
  has_many :project_users
  has_many :todos, foreign_key: "owner"

end
