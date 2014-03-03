class Meeting < ActiveRecord::Base
  attr_accessible :host_user_id, :project_id, :purpose, :title, :date, :start_time, :end_time, :create_user_id
end
