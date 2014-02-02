class SessionsController < ApplicationController

	# GET /sessions/new
	# return signin form
	def new
		
	end

	# POST /admin/signin
	# try to sign in
	def admin_signin
		admin = Admin.check(params[:username], params[:password])
		if admin
			session[:admin_id] = admin.id
			flash[:alert] = "Signed in successfully."
			redirect_to api_keys_path
		else
			flash[:alert] = "Invalid email or password"
			render 'new'
		end
	end

	# GET /admin/signout
	def admin_signout
		session[:admin_id] = nil
		flash[:alert] = "Signed out successfully."
		redirect_to root_path
	end
		
end
