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
			redirect_to admins_path :notice => "Signed in!"
		else
			flash.now.alert = "Invalid email or password"
			render 'new'
		end
	end

	# GET /admin/signout
	def admin_signout
		session[:admin_id] = nil
		redirect_to root_path :notice => "Signed out!"
	end
		
end
