class ApiKeysController < ApplicationController
	before_action :require_signin

	def index
		@key = ApiKey.all
	end

	def show
		@key = ApiKey.find(params[:id])
	end

	def edit
		
	end

	def destroy
		@key = ApiKey.find(params[:id])
		@key.destroy
		flash[:alert] = "The application was successfully removed."
		redirect_to api_keys_path
	end
end
