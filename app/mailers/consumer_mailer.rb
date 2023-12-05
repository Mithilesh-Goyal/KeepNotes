class ConsumerMailer < ApplicationMailer
  default :from => "mithilesh.goyal1@gmail.com"
  def welcome_email(consumer)
    @consumer = consumer
    @url  = "http://mithilesh.goyal1@gmail.com/login"
    mail(:to => user.email, :subject => "Welcome to My Awesome Site")
  end
end
