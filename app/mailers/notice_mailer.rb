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
end
