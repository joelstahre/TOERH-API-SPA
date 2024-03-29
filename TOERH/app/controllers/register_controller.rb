class RegisterController < ApplicationController
	def index
		
	end

	# Show Register form for new Application
	def new
		@application = Application.new
	end

	# Create a new application and generate a new auth_token
	def create
	    @application = Application.new(application_params)
	    
	    key = ApiKey.new
	    
	    @application.api_key = key
	    
	    if @application.save
	      key.save
	      ApplicationMailer.register_success(@application).deliver
	      render :action => "success"
	      
	    else
	      render :action => "new"
	    end 
  	end

  	private 
  
  	# Prevent mass assagniment
  	def application_params
    	params.require(:application).permit(:app_name, :app_desc, :owner_name, :contact_mail)
  	end
end
