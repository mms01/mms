class Todo < ActiveRecord::Base

#  validates :owner, :summary, presence: true
  validates :summary, presence: true

  attr_accessible :id,
                  :created_at,
                  :updated_at,
                  :meeting_id,
                  :summary, 
                  :detail, 
                  :owner,
                  :enddate,
                  :sts,
                  :biko,
                  :createdby

    belongs_to :meeting
    belongs_to :user, foreign_key: "owner"

end
