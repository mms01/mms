# coding: utf-8

class HomeController < ApplicationController
  def index
    @title = "Meeting Management System Home"
    @catch_phrase = "　　開催予定ミーティング、及びその議事録を管理するサイトです。"
  
    @projects = Project.joins('INNER JOIN project_users ON project_users.project_id = projects.id').where('project_users.user_id = ?', current_user.id).order("name ASC")  
  
  end
end
