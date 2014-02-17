module Api
    module V1
        class ResourcesController < ApplicationController
            before_filter :restrict_access

            respond_to :json, :xml

            # GET
            def index

                begin
                    r = Resource.all
                    result = get_result(201, 'Successfully fetched all resources', r)
                rescue
                    result = get_result(500, 'Faild to fetched all resources', r)
                end

                respond_format(result)
            end

            # GET/id
            def show

                begin
                    r = Resource.find(params[:id])
                    result = get_result(201, 'Successfully fetched Resource', r)
                rescue
                    result = get_result(500, 'Faild to find Resource', r)
                end

                respond_format(result)
            end

            # POST
            def create

                begin
                    r = Resource.new(resource_params)

                    params[:tags].each do |tag|
                        r.tags << Tag.find(tag)
                    end

                    if r.save
                        result = get_result(201, 'Resource successfully created', r)
                    else
                        result = get_result(500, 'Faild to create Resource', r)
                    end

                rescue
                    result = get_result(500, 'Faild to create Resource', r)
                end

                respond_format(result)

            end

            # PUT
            def update
                
                begin
                    r = Resource.find(params[:id])
                    
                    # TODO: Hur skall taggar hanteras vid update, lägga till, ta bort.
                    params[:tags].each do |tag|
                        r.tags << Tag.find(tag)
                    end

                    if r.update(resource_params)
                        result = get_result(201, 'Resource successfully updated', r)
                    else
                        result = get_result(500, 'Faild to update Resource', r)
                    end

                rescue
                    result = get_result(500, 'Faild to find Resource', r)
                end

                respond_format(result)
            end

            # DELETE
            def destroy
                
                begin
                    r = Resource.find(params[:id])

                    if r.destroy
                        result = get_result(201, 'Resource successfully deleted', r)
                    else
                        result = get_result(500, 'Faild to delete Resource', r)
                    end

                rescue
                    result = get_result(500, 'Faild to find Resource', r)
                end

                respond_format(result)

            end

            private 
  
            # Prevent mass assagniment
            def resource_params
                params.require(:resource).permit(:title, :description, :url, :user_id, :resource_type_id, :licence_id, :tags)
            end

        end
    end
end