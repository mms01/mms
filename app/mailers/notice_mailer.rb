class NoticeMailer < ActionMailer::Base
  default from: "Saratani_Masaya@ogis-ri.co.jp"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.notice_mailer.sendmail_confirm.subject
  #
  def sendmail
    @greeting = "Hi"

    mail to: "Saratani_Masaya@ogis-ri.co.jp"
  end

  def send_meeting_notification(meeting, subject, body, user)
    @subject = subject
    @to = []

    @to_users = User.joins("JOIN project_users ON project_users.user_id = users.id").where("project_users.project_id = ?", meeting.project_id)
    for to_user in @to_users do
      @to.push to_user.email
    end

    @from = user.email
    @body = body

    mail(:to => @to,
         :subject => @subject,
         :from => @from) do |format|
      format.text
    end
  end

end
