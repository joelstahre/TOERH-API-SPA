module Api
    module V1
        class ResourcesController < ApplicationController
            before_filter :restrict_access

            respond_to :json, :xml

            def index
                respond_with Resource.all
            end

            def show
                respond_with Resource.find(params[:id])
            end

            def create

                begin
                    r = Resource.new(resource_params)

                    params[:tags].each do |tag|
                        r.tags << Tag.find(tag)
                    end

                    if r.save
                        response.status = 201
                        result = { status: response.status, message: 'Resource successfully created', data: r}
                    else
                        response.status = 500
                        result = { status: response.status, message: 'Resource could not be created'}
                    end

                rescue
                    response.status = 500
                    result = { status: response.status, message: 'Resource could not be created'}
                end

                respond_format(result)
                
            end

            def update
                respond_with Resource.update(params[:id], params[:resource])
            end

            def destroy
                
                begin
                    r = Resource.find(params[:id])

                    if r.destroy
                        response.status = 201
                        result = { status: response.status, message: 'Resource successfully Deleted'}
                    else
                        response.status = 500
                        result = { status: response.status, message: 'Resource could not be Deleted'}
                    end

                rescue
                    response.status = 500
                    result = { status: response.status, message: 'Resource could not be found'}

                end

               
                respond_format(result)

            end

            private 
  
            # Prevent mass assagniment
            def resource_params
                params.require(:resource).permit(:title, :description, :url, :user_id, :resource_type_id, :licence_id, :tags)
            end

            def respond_format(result)
                respond_with do |format|
                    format.json {render json: result}
                    format.xml {render xml: result}
                end
            end

        end
    end
end