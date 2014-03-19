class Project < ActiveRecord::Base
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
end
