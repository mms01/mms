class Todo < ActiveRecord::Base

  attr_accessible :id,
                  :created_at,
                  :updated_at,
                  :metting_id,
                  :summary, 
                  :detail, 
                  :owner,
                  :enddate,
                  :sts,
                  :biko

    belongs_to :meeting
    belongs_to :user, foreign_key: "owner"

end
