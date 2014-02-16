class ApiKeysController < ApplicationController
	before_action :require_signin

	# GET /api_keys
	# Show all api keys
	def index
		@key = ApiKey.all
	end

	# GET /api_keys/1
	# Show a specifik api_key
	def show
		@key = ApiKey.find(params[:id])
	end

	def edit
		
	end

	# PUT /api_keys/1
	# Update specifik api_key
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

	# DELETE /api_keys/1
	# Delete a specifik api_key
	def destroy
		@key = ApiKey.find(params[:id])
		@key.destroy
		flash[:alert] = "The application was successfully removed."
		redirect_to api_keys_path
	end
end