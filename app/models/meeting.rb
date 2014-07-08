# coding: utf-8

class Meeting < ActiveRecord::Base
  attr_accessible :id,
                  :project_id, 
                  :title,
                  :purpose, 
                  :user_id,
                  :create_user_id,
                  :place,
                  :update_date,
                  :available,
                  :meeting_date,
                  :start_time, 
                  :end_time,
                  :status,
                  :update_user_id
  
  validates :title,
    :presence => { :message => '(議題)は必ず入力してください。' }
    
  belongs_to :project
  belongs_to :user
  has_many :todo

end
