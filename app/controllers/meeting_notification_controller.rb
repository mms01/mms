class MeetingNotificationController < ApplicationController
  def index
    @title = "ミーティング開催通知"
    @catch_phrase = "　　メールでミーティングの開催を通知します。"

    @meeting_id = params['meeting_id']

    @meeting = Meeting.where("meetings.id = ?", params['meeting_id'])[0]
    @project = Project.where("projects.id = ?", @meeting.project_id)[0]
    @subject = "[" + @project.name + ":ミーティング開催通知] " + @meeting.title
    @body = "\n\n\n-----------------------------\n"
    @body += "目的:\n  " + @meeting.purpose
    @body += "\n開催場所:\n  " + @meeting.place
    @body += "\n開催日時:\n  " + @meeting.meeting_date.strftime("%Y年%m月%d日")
    @body += " " + @meeting.start_time.strftime("%H:%M")
    @body += "～" + @meeting.end_time.strftime("%H:%M")

  end

  def notify
    @title = "ミーティング開催通知"
    @catch_phrase = "　　メールでミーティングの開催を通知します。"

    @meeting = Meeting.where("meetings.id = " + params['meeting_id'])[0]

    puts "aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
    #puts "subject : " + params['subject']
    #puts "body : " + params['body']

    #puts NoticeMailer.send_meeting_notification(@meeting, params['subject'], params['body'], current_user)
    NoticeMailer.send_meeting_notification(@meeting, params['subject'], params['body'], current_user).deliver
  end
end
