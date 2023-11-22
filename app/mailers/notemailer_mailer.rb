class NotemailerMailer < ApplicationMailer
  def send_mail_note(note)
  @note = Note
  @subject = "hey"
  mail(to:mithgoyal24@gmail.com,subject: @subject)
  end
end
