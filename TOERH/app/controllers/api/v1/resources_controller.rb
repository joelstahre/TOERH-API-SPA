module Api
    module V1
        class ResourcesController < ApplicationController
            before_filter :restrict_access

            respond_to :json

            def index
                respond_with Resource.all
            end

            def show
                respond_with Resource.find(params[:id])
            end

            def create
                respond_with Resource.create(params[:resource])
            end

            def update
                respond_with Resource.update(params[:id], params[:resource])
            end

            def destroy
                respond_with Resource.destroy(params[:id])
            end

            private 

            def restrict_access
                authenticate_or_request_with_http_token do |token, options|
                    ApiKey.exists?(auth_token: token)
                end
            end

        end
    end
end