module Api
    module V1
        class ResourcesController < ApiController
            before_filter :restrict_access
            respond_to :json, :xml

            # GET /api/v1/resources
            # GET /api/v1/users/:id/resources
            # GET /api/v1/resource_types/:resource_type_id/resources
            # GET /api/v1/licences/:licence_id/resources
            # GET /api/v1/tags/:tag_id/resources
            def index

                user_id = params[:user_id]
                resource_type_id = params[:resource_type_id]
                licence_id = params[:licence_id]
                tag_id = params[:tag_id]

                @limit = params[:limit] || 2
                @offset = params[:offset] || 0
                

                begin
                    if user_id
                        @r = Resource.limit(@limit).offset(@offset).order(id: :desc).where(user_id: user_id)
                        @response = get_result(200, 'Successfully fetched all resources for user with id:' + user_id, @r.count, @limit, @offset)
                        @param = 'user_id=' + user_id + '&'
                    
                    elsif resource_type_id
                        @r = Resource.limit(@limit).offset(@offset).order(id: :desc).where(resource_type_id: resource_type_id)
                        @response = get_result(200, 'Successfully fetched all resources with resource_type_id:' + resource_type_id, @r.count, @limit, @offset)
                        @param = 'resource_type_id=' + resource_type_id + '&'

                    elsif licence_id
                        @r = Resource.limit(@limit).offset(@offset).order(id: :desc).where(licence_id: licence_id)
                        @response = get_result(200, 'Successfully fetched all resources with licence_id:' + licence_id, @r.count, @limit, @offset)
                        @param = 'licence_id=' + licence_id + '&'

                    elsif tag_id
                        @r = Tag.find(tag_id).resources.limit(@limit).offset(@offset).order(id: :desc)
                        @response = get_result(200, 'Successfully fetched all resources with tag_id:' + tag_id, @r.count, @limit, @offset)
                        @param = 'tag_id=' + tag_id + '&'

                    else
                        @r = Resource.limit(@limit).offset(@offset).order(id: :desc)
                        @response = get_result(200, 'Successfully fetched all resources', @r.count, @limit, @offset)

                    end
                rescue
                    @response = get_result(500, 'Faild to fetched all resources')
                end

                render 'API/resources/index'
            end

            # GET /api/v1/resources/:id
            def show

                begin
                    @r = Resource.find(params[:id])
                    @response = get_result(200, 'Successfully fetched Resource')

                rescue
                    @response = get_result(500, 'Faild to find Resource')
                end

                render 'API/resources/show'
            end

            # POST /api/v1/resources
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

                render 'API/resources/create'
            end

            # PUT /api/v1/resources/:id
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

                render 'API/resources/update'
            end

            # DELETE /api/v1/resources/:id
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

                render 'API/resources/destroy'
            end

            private 
  
            # Prevent mass assagniment
            def resource_params
                params.require(:resource).permit(:title, :desciption, :url, :user_id, :resource_type_id, :licence_id, :tags)
            end

        end
    end
end