class RegisterMailer < ActionMailer::Base
  default from: "from@example.com"

  def register_success(application)
  	@application = application
  	mail(to: @application.contact_mail, subject: 'Welcome aboard!')
  end
end
