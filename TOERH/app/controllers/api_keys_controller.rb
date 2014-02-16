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

	def update
		@key = ApiKey.find(params[:id])

		if @key
			if @key.revoked
				@key.update(revoked: false)
				flash[:alert] = "You allowed the key"
			else
				@key.update(revoked: true)
				flash[:alert] = "You revoked the key"
			end
			redirect_to api_key_path
		end
	end

	def destroy
		@key = ApiKey.find(params[:id])
		@key.destroy
		flash[:alert] = "The application was successfully removed."
		redirect_to api_keys_path
	end
end