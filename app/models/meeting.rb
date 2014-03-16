class Meeting < ActiveRecord::Base
  attr_accessible :id,
                  :project_id, 
                  :title,
                  :purpose, 
                  :host_user_id,
                  :create_user_id,
                  :place,
                  :update_date,
                  :available,
                  :meeting_date,
                  :start_time, 
                  :end_time
end
