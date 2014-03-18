class OmniSessionsController < ApplicationController

    def create
        auth = request.env["omniauth.auth"]
        user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omniauth(auth)
        User.update_user(user, auth)
        user.save()

        redirect_url = session[:client_id]
        session[:client_id] = nil
        redirect_to "#{redirect_url}?auth_token=#{user.auth_token}&id=#{user.id}&username=#{Rack::Utils.escape(user.name)}&token_expires=#{Rack::Utils.escape(user.token_expires.to_s)}"
        
    end

    # http://localhost:3000/authenticate?callback=http://localhost:8080
    def authenticate
        session[:client_id] = params[:callback]
        redirect_to '/auth/github'
    end
end
