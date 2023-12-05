# Preview all emails at http://localhost:3000/rails/mailers/consumer_mailer
class ConsumerMailerPreview < ActionMailer::Preview
  def consumer_created
    ConsumerMailer.consumer_created
  end
end
