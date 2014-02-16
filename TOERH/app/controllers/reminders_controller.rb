class RemindersController < ApplicationController
	def new
  	end

  	# TODO Validation?
    # Send an email to the users email address
	def create
  		@email = params[:email]
		@application = Application.find_by_contact_mail(@email)

		if @application
			ApplicationMailer.send_token(@application).deliver
			render :action => "success"
		else
			render :action => "fail"
		end
  	end
end
