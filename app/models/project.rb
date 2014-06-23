class Project < ActiveRecord::Base
  validates :manager_id, :name, presence: true

  attr_accessible :name,
                  :created_at,
                  :updated_at,
                  :manager_id,
                  :start_date, 
                  :end_date, 
                  :create_user_id,
                  :sts,
                  :atached,
                  :purpose

  belongs_to :user, foreign_key: "manager_id"

  has_many :project_users

end
