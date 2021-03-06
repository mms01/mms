class ProjectsController < ApplicationController
  # GET /projects
  # GET /projects.json

  # プロジェクト一覧
  def index
   @user = User.new
   @projects = Project.order("id")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @projects }
    end

#    @projects = Project.order("id")
  end



  # 検索
#  def search
#      @projects = Project.search(params[:q])
#      render "index"
#  end


  # GET /projects/1
  # GET /projects/1.json

  def show
    @project = Project.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @project }
    end
  end

  # GET /projects/new
  # GET /projects/new.json
  def new
    @user = User.where("users.id  > 0").where("users.available=TRUE").order("users.user_name ASC")
    @project = Project.new
    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @project }
    end

  end

  # GET /projects/1/edit
  def edit
    @user = User.where("users.id  > 0").where("users.available=TRUE").order("users.user_name ASC")
    @project = Project.find(params[:id])
  end

  # POST /projects
  # POST /projects.json
  def create
    @user = User.all
    @project = Project.new(params[:project])

    respond_to do |format|
      if @project.save
        format.html { redirect_to @project, notice: '作成が完了しました！' }
        format.json { render json: @project, status: :created, location: @project }
      else
        format.html { render action: "new" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /projects/1
  # PUT /projects/1.json
  def update
    @user = User.where("users.id  > 0").where("users.available=TRUE").order("users.user_name ASC")

    @project = Project.find(params[:id])

    respond_to do |format|
      if @project.update_attributes(params[:project])
        format.html { redirect_to @project, notice: '更新が完了しました！' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @project.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /projects/1
  # DELETE /projects/1.json
  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    respond_to do |format|
      format.html { redirect_to projects_url }
      format.json { head :no_content }
    end
  end



end
