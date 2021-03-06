﻿class ProjectUsersController < ApplicationController
  # GET /project_users
  # GET /project_users.json
  def index
    @title = "プロジェクトユーザ一覧"
    @catch_phrase = "　　プロジェクトとユーザの紐付けを行います。"

    #@project_users = ProjectUser.all
    @project_users = ProjectUser.joins('INNER JOIN projects ON project_users.project_id = projects.id')
    					.joins('INNER JOIN users ON project_users.user_id = users.id')
    					.where('projects.delete_flag = false').where('users.available = true')
    					.order('projects.name ASC').order('users.user_name ASC')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_users }
    end
  end

  # GET /project_users/1
  # GET /project_users/1.json
  def show
    @title = "プロジェクトユーザ詳細"
    @catch_phrase = "プロジェクトユーザの詳細情報を表示します。"
    @project_user = ProjectUser.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project_user }
    end
  end

  # GET /project_users/new
  # GET /project_users/new.json
  def new
    @project_user = ProjectUser.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project_user }
    end
  end

  # GET /project_users/1/edit
  def edit
    @project_user = ProjectUser.find(params[:id])
  end

  # POST /project_users
  # POST /project_users.json
  def create
    @project_user = ProjectUser.new(params[:project_user])

    respond_to do |format|
      if @project_user.save
        format.html { redirect_to @project_user, notice: '作成が完了しました！' }
        format.json { render json: @project_user, status: :created, location: @project_user }
      else
        format.html { render action: "new" }
        format.json { render json: @project_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /project_users/1
  # PUT /project_users/1.json
  def update
    @project_user = ProjectUser.find(params[:id])

    respond_to do |format|
      if @project_user.update_attributes(params[:project_user])
        format.html { redirect_to @project_user, notice: '更新が完了しました！' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /project_users/1
  # DELETE /project_users/1.json
  def destroy
    @project_user = ProjectUser.find(params[:id])
    @project_user.destroy

    respond_to do |format|
      format.html { redirect_to project_users_url }
      format.json { head :no_content }
    end
  end
end
