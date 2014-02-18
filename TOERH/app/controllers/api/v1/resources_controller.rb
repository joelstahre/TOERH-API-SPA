module Api
    module V1
        class ResourcesController < ApiController
            before_filter :restrict_access

            respond_to :json, :xml

            # GET
            def index

                begin
                    @r = Resource.all
                    @response = get_result(200, 'Successfully fetched all resources')
                rescue
                    @response = get_result(500, 'Faild to fetched all resources')
                end

                render 'resources/index'
            end

            # GET/id
            def show

                begin
                    @r = Resource.find(params[:id])
                    @response = get_result(200, 'Successfully fetched Resource')
                rescue
                    @response = get_result(500, 'Faild to find Resource')
                end

                render 'resources/show'
            end

            # POST
            def create

                begin
                    @r = Resource.new(resource_params)

                    params[:tags].each do |tag|
                        @r.tags << Tag.find(tag)
                    end

                    if @r.save
                        @response = get_result(201, 'Resource successfully created')
                    else
                        @response = get_result(500, 'Faild to create Resource')
                    end

                rescue
                    @response = get_result(500, 'Faild to create Resource')
                end

                render 'resources/create'
            end

            # PUT
            def update
                
                begin
                    @r = Resource.find(params[:id])
                    
                    # TODO: Hur skall taggar hanteras vid update, lägga till, ta bort.
                    params[:tags].each do |tag|
                        @r.tags << Tag.find(tag)
                    end

                    if @r.update(resource_params)
                        @response = get_result(200, 'Resource successfully updated')
                    else
                        @response = get_result(500, 'Faild to update Resource')
                    end

                rescue
                    @response = get_result(500, 'Faild to find Resource')
                end

                render 'resources/update'
            end

            # DELETE
            def destroy
                
                begin
                    @r = Resource.find(params[:id])

                    if @r.destroy
                        @response = get_result(200, 'Resource successfully deleted')
                    else
                        @response = get_result(500, 'Faild to delete Resource')
                    end

                rescue
                    @response = get_result(500, 'Faild to find Resource')
                end

                render 'resources/destroy'
            end

            private 
  
            # Prevent mass assagniment
            def resource_params
                params.require(:resource).permit(:title, :desciption, :url, :user_id, :resource_type_id, :licence_id, :tags)
            end

        end
    end
end