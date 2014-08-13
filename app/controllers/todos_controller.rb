# coding: utf-8

class TodosController < ApplicationController
  # GET /todo
  # GET /todo.json
  def index
    #@user = User.all
    @todos = Todo.where(meeting_id: params[:meeting_id])

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @todos }
    end
  end

  # GET /todo/1
  # GET /todo/1.json
  def show
    @todo = Todo.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todo/new
  # GET /todo/new.json
  def new
    @meeting = Meeting.find_by_id(params[:meeting_id])
    @users = User.joins('INNER JOIN project_users ON project_users.user_id = users.id')
    		.where('users.id  > 0').where('users.available=TRUE')
    		.where('project_users.project_id = ?', @meeting.project_id)
    		.order('users.user_name ASC')
    
    
    @todo = Todo.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @todo }
    end
  end

  # GET /todo/1/edit
  def edit
    @todo = Todo.find(params[:id])
    @meeting = Meeting.find_by_id(@todo.meeting_id)
    
    @users = User.joins('INNER JOIN project_users ON project_users.user_id = users.id')
    		.where('users.id  > 0').where('users.available=TRUE')
    		.where('project_users.project_id = ?', @meeting.project_id)
    		.order('users.user_name ASC')
    
  end

  # POST /todo
  # POST /todo.json
  def create
    @user = User.all    
    @todo = Todo.new(params[:todo])

    respond_to do |format|
      if @todo.save
        format.html { redirect_to @todo, notice: 'ToDoを作成しました' }
        format.json { render json: @todo, status: :created, location: @todo }
      else
        format.html { render action: "new" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /todo/1
  # PUT /todo/1.json
  def update
    @todo = Todo.find(params[:id])

    respond_to do |format|
      if @todo.update_attributes(params[:todo])
        format.html { redirect_to @todo, notice: 'ToDoを更新しました' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @todo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /todo/1
  # DELETE /todo/1.json
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    respond_to do |format|
      format.html { redirect_to :controller => 'todos', :action => 'index', :meeting_id => @todo.meeting_id }
      format.json { head :no_content }
    end
  end

end
