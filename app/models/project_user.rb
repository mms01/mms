class ProjectUser < ActiveRecord::Base
  attr_accessible :project_id, :user_id

  validates :project_id, :uniqueness => {:scope => :user_id}

  belongs_to :user
  belongs_to :project
end
