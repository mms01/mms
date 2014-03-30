# coding: utf-8

class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
    @title = "ミーティング一覧"
    @catch_phrase = "　　ミーティング及び議事録の登録・編集を行います。"
    @meetings = Meeting.where("meetings.id  > 0").joins("JOIN users ON users.id = meetings.user_id").order("meeting_date DESC").order("start_time DESC")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @meetings }
    end
    
  end

  # GET /meetings/1
  # GET /meetings/1.json
  def show
    @title = "ミーティング詳細"
    @catch_phrase = "　　ミーティングの詳細情報を表示します。"
    
    @meeting = Meeting.joins("JOIN users ON users.id = meetings.user_id").find(params[:id])
    #@meeting = Meeting.find(params[:id], :include => [:user_id, :email])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @meeting }
    end
  end

  # GET /meetings/new
  # GET /meetings/new.json
  def new
    @title = "ミーティング登録"
    @catch_phrase = "　　新規にミーティングを登録します。"
    @notice = ""

    @meeting = Meeting.new
    if request.post? then
      @meeting = Meeting.new(params[:meeting])
      @flg = !@meeting.save
      if !@flg then
        @msg = "登録が完了しました。"
      end
    end
    @datas = Meeting.where("id  > 0").order("name ASC")
    @projects = Project.where("id  > 0").order("name ASC")
    @users = User.where("id  > 0").order("email ASC")

#    @meeting = Meeting.new
#
#    respond_to do |format|
#      format.html # new.html.erb
#      format.json { render json: @meeting }
#    end
  end

  # GET /meetings/1/edit
  def edit
    @title = "ミーティング編集"
    @catch_phrase = "　　ミーティングの編集及び議事録の登録・編集を行います。"
    @notice = ""
    
    @meeting = Meeting.find(params[:id])

  end

  # POST /meetings
  # POST /meetings.json
  def create
    @meeting = Meeting.new(params[:meeting])

    respond_to do |format|
      if @meeting.save
        format.html { redirect_to @meeting, notice: '作成が完了しました！' }
        format.json { render json: @meeting, status: :created, location: @meeting }
      else
        format.html { render action: "new" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /meetings/1
  # PUT /meetings/1.json
  def update
    @meeting = Meeting.find(params[:id])

    respond_to do |format|
      if @meeting.update_attributes(params[:meeting])
        format.html { redirect_to @meeting, notice: '更新が完了しました！' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @meeting.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /meetings/1
  # DELETE /meetings/1.json
  def destroy
    @meeting = Meeting.find(params[:id])
    if !checkme? @meeting then return end
    @meeting.destroy

    respond_to do |format|
      format.html { redirect_to meetings_url }
      format.json { head :no_content }
    end
  end
  
  # DELETE
  def delete
    obj = Meeting.find(params[:id])
    obj.destroy
    redirect_to :action => "index"
  end
  
end
