# coding: utf-8

class MeetingsController < ApplicationController
  # GET /meetings
  # GET /meetings.json
  def index
    @title = "ミーティング一覧"
    @catch_phrase = "　　ミーティング及び議事録の登録・編集を行います。"
    
    @page = params[:page].to_i
    @page_num = 10
    
    ##@meetings = Meeting.where("meetings.id  > 0").joins('INNER JOIN project_users ON project_users.project_id = meetings.project_id')
    ##						.joins('INNER JOIN projects ON project_users.project_id = projects.id')
    ##						.where('project_users.user_id = ?', current_user.id)
    ##						.where('projects.delete_flag = FALSE')
    ##						.order("meeting_date DESC").order("start_time DESC")
    ##						.offset(@page * @page_num).limit(@page_num)
    						
    #@meetings = Meeting.where("meetings.id  > 0").joins('INNER JOIN project_users ON project_users.project_id = meetings.project_id')
    #						.joins('INNER JOIN projects ON project_users.project_id = meetings.id')
    #						.where('project_users.user_id = ?', current_user.id)
    #						.where('projects.delete_flag = FALSE')
    #						.order("meeting_date DESC").order("start_time DESC")
    #						.offset(@page * @page_num).limit(@page_num)

	@meetings = Meeting.where("meetings.id  > 0").joins('INNER JOIN project_users ON project_users.project_id = meetings.project_id')
    						.where('project_users.user_id = ?', current_user.id)
    						.order("meeting_date DESC").order("start_time DESC")
    						.offset(@page * @page_num).limit(@page_num)
    						

    ##@record_count = Meeting.where("meetings.id  > 0").joins('INNER JOIN project_users ON project_users.project_id = meetings.project_id')
	##						.joins('INNER JOIN projects ON project_users.project_id = projects.id')
    ##						.where('project_users.user_id = ?', current_user.id)
    ##						.where('projects.delete_flag = FALSE')
    ##						.count
    
    @record_count = Meeting.where("meetings.id  > 0").joins('INNER JOIN project_users ON project_users.project_id = meetings.project_id')
							.joins('INNER JOIN projects ON project_users.project_id = projects.id')
    						.where('project_users.user_id = ?', current_user.id)
    						.where('projects.delete_flag = FALSE')
    						.count
    						
    @projects = Project.joins('INNER JOIN project_users ON project_users.project_id = projects.id')
    						.where('project_users.user_id = ?', current_user.id)
    						.where('projects.delete_flag = FALSE')
    						.order("name ASC")

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
    
    @datas = []
    @datas = Minute.where("meeting_id='" << params[:id] << "'")
    if @datas.exists? then
      @minute_id = @datas[0].id
      @exist_minute = 1
    else
      @minute_id = "なし"
      @exist_minute = 0
    end
    
    @datas = []
    @datas = Todo.where("meeting_id='" << params[:id] << "'")
    if @datas.exists? then
      @exist_todo = 1
    else
      @exist_todo = 0
    end

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

    @projects = Project.joins('INNER JOIN project_users ON project_users.project_id = projects.id')
    					.where('project_users.user_id = ?', current_user.id)
    					.where('projects.delete_flag = FALSE').order("name ASC")
    
    if @projects.exists? then			
      @users = User.joins('INNER JOIN project_users ON project_users.user_id = users.id')
    			.where("users.id  > 0").where("users.available=TRUE")
    			.where('project_users.project_id = ?', @projects.first.id)
    			.order("users.user_name ASC")
    else
      @users = []
    end
    

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
    @users = User.joins('INNER JOIN project_users ON project_users.user_id = users.id')
    			.where("users.id  > 0").where("users.available=TRUE")
    			.where('project_users.project_id = ?', @meeting.project_id)
    			.order("users.user_name ASC")
    
    @current_user_idx = 0
    @users.each do |user|
      if user.id == @meeting.user_id then
        break
      else
        @current_user_idx = @current_user_idx + 1
      end
    end

  end

  # POST /meetings
  # POST /meetings.json
  def create
    @title = "ミーティング登録"
    @catch_phrase = "　　新規にミーティングを登録します。"
    @notice = ""
    @meeting = Meeting.new(params[:meeting])
    @projects = Project.where("id  > 0").order("name ASC")
    @users = User.where("id  > 0").where("available=TRUE").order("user_name ASC")

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
    @title = "ミーティング編集"
    @catch_phrase = "　　ミーティングの編集及び議事録の登録・編集を行います。"
    @notice = ""
    
    @meeting = Meeting.find(params[:id])
    @projects = Project.joins('INNER JOIN project_users ON project_users.project_id = projects.id').where('project_users.user_id = ?', current_user.id).order("name ASC")
    @users = User.where("id  > 0").order("user_name ASC")

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
  
  #Find
  def find
    @title = "ミーティングの検索結果"
    #@projects = Project.where("id  > 0").order("name ASC")
    
    @page = params[:page].to_i
    @page_num = 10

	if params[:project_id] == ""
      # プロジェクトが指定されていない場合
	  @meetings = Meeting.where("meetings.id  > 0").joins('INNER JOIN project_users ON project_users.project_id = meetings.project_id')
    						.where('project_users.user_id = ?  and meetings.title like ?', current_user.id, "%"+params[:title]+"%")
    						.order("meeting_date DESC").order("start_time DESC")
    						.offset(@page * @page_num).limit(@page_num)

      @record_count = Meeting.where("meetings.id  > 0").joins('INNER JOIN project_users ON project_users.project_id = meetings.project_id')
							.joins('INNER JOIN projects ON project_users.project_id = projects.id')
    						.where('project_users.user_id = ?', current_user.id)
    						.where('projects.delete_flag = FALSE')
    						.count

    else 
      # プロジェクトが指定されている場合
      @meetings = Meeting.where("meetings.id  > 0").joins('INNER JOIN project_users ON project_users.project_id = meetings.project_id')
    						.where('project_users.user_id = ?  and meetings.title like ? and meetings.project_id = ?', current_user.id, "%"+params[:title]+"%", params[:project_id])
    						.order("meeting_date DESC").order("start_time DESC")
    						.offset(@page * @page_num).limit(@page_num)

      @record_count = Meeting.where("meetings.id  > 0").joins('INNER JOIN project_users ON project_users.project_id = meetings.project_id')
							.joins('INNER JOIN projects ON project_users.project_id = projects.id')
    						.where('project_users.user_id = ?  and meetings.title like ? and meetings.project_id = ?', current_user.id, "%"+params[:title]+"%", params[:project_id])
    						.where('projects.delete_flag = FALSE')
    						.count
    end
    						
    @projects = Project.joins('INNER JOIN project_users ON project_users.project_id = projects.id')
    						.where('project_users.user_id = ?', current_user.id)
    						.order("name ASC")


# 開催日が過去のものを除外するチェックボックス


    #respond_to do |format|
    #  format.html # index.html.erb
    #  format.json { render json: @meetings }
   # end
   

   
   # @meetings = Meeting.where("meetings.id  > 0").joins("JOIN users ON users.id = meetings.user_id").order("meeting_date DESC").order("start_time DESC")
   #@meetings = Meeting.where('meetings.id  > 0 and title like ?', "%"+params[:title]+"%").joins("JOIN projects ON projects.id = meetings.project_id").order("meeting_date DESC").order("start_time DESC")
   #@meetings = Meeting.where("meetings.id  > 0").joins("JOIN projects ON projects.id = meetings.project_id").order("meeting_date DESC").order("start_time DESC")
   render "index"
    
  end
  
  
  # jQuery内からRailsのActionを叩く
  # http://qiita.com/somewhatgood@github/items/113773747a6faa800366
  
  # プルダウンの連動
  # http://itmemojp.blogspot.jp/2012/10/rails.html ←記述内容に誤りあり
  # 関連するファイル
  #  views/meetings/new.html.erb : 連動される側のコンボボックスのHTMLを外出し
  #  views/meetings/_meeting_users_select.html.erb : 外出ししたコンボボックス。部分ファイルなのでファイル名先頭にアンダースコアをつける
  #  assets/javascripts/meetings.js : jQueryを記述。連動トリガーのコンボボックスの変更を感知してアクションを呼び出す。application.js だと動かなかった…
  #  controlloers/meetings_controller.rb : このファイル。対象Userを絞り込む。
  #  views/meetings/meeting_users_select.js.erb : 連動される側のプルダウンを上書きする。こちらはファイル名の先頭にアンダースコアがつかない
  #  routes.rb (mms/config配下) : "resources :meetings"より前に、"get meetings/meeting_users_select"を記述。getのかわりに matchでも構わない

  
  def meeting_users_select
    @users = User.joins('INNER JOIN project_users ON project_users.user_id = users.id')
    			.where("users.id  > 0").where("users.available=TRUE")
    			.where('project_users.project_id = ?', params[:project_id])
    			.order("users.user_name ASC")
    
    render
  end
  
end
