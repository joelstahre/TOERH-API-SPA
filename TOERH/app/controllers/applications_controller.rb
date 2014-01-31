class ApplicationsController < ApplicationController

	def index
  end
  
  def new
    @application = Application.new
  end
  
  def create
    @application = Application.new(application_params)
    
    key = ApiKey.new(:auth_token => 785480)
    
    @application.api_key = key
    
    if @application.save
      redirect_to applications_path
    else
      render :action => "new"
    end 
  end
  
  private 
  
  def application_params
    params.require(:application).permit(:app_name, :app_desc, :owner_name, :contact_mail)
  end
  
end
