class ApplicationsController < ApplicationController

	def index
  end
  
  def new
    @application = Application.new
  end
  
  def create
    @application = Application.new(application_params)
    
    key = ApiKey.new
    
    @application.api_key = key
    
    if @application.save
      key.save
      render :action => "success"
      
    else
      render :action => "new"
    end 
  end

  
  private 
  
  def application_params
    params.require(:application).permit(:app_name, :app_desc, :owner_name, :contact_mail)
  end
  
end
