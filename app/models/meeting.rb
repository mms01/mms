class Meeting < ActiveRecord::Base
  attr_accessible :host_user_id, :project_id, :purpose, :title
end
