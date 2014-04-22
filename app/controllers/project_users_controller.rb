class ProjectUsersController < ApplicationController
  # GET /project_users
  # GET /project_users.json
  def index
    @project_users = ProjectUser.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @project_users }
    end
  end

  # GET /project_users/1
  # GET /project_users/1.json
  def show
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
        format.html { redirect_to @project_user, notice: 'Project user was successfully created.' }
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
        format.html { redirect_to @project_user, notice: 'Project user was successfully updated.' }
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
