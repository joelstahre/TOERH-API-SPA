module Api
    module V1
        class ResourcesController < ApiController
            
            before_filter :restrict_access

            # CORS
           # before_filter :restrict_access, :except => [:options]
           # before_filter :set_headers
            respond_to :json, :xml

            # GET /api/v1/resources
            # GET /api/v1/users/:id/resources
            # GET /api/v1/resource_types/:resource_type_id/resources
            # GET /api/v1/licences/:licence_id/resources
            # GET /api/v1/tags/:tag_id/resources
            def index
                search = params[:search]
                user_id = params[:user_id]
                resource_type_id = params[:resource_type_id]
                licence_id = params[:licence_id]
                tag_id = params[:tag_id]

                @limit = params[:limit] || 10
                @offset = params[:offset] || 0

                # Ful lösning!! 
                @prev = "http://#{request.host_with_port}#{api_v1_resources_path}?#{@param}limit=#{@limit}&offset=#{@offset.to_i - @limit.to_i}"
                @next = "http://#{request.host_with_port}#{api_v1_resources_path}?#{@param}limit=#{@limit}&offset=#{@offset.to_i + @limit.to_i}"

                if @offset.to_i <= 0
                    @prev = nil
                end
                
               
                begin

                    if search
                        @r = Resource.search(search)
                        @response = get_result(200, 'Result for your search: ' + search)
                    elsif user_id

                        @r = Resource.get_resources_by_user_id(user_id)
                        @response = get_result(200, 'Successfully fetched all resources for user with id:' + user_id, @r.count)
                        @param = 'user_id=' + user_id + '&'
                    
                    elsif resource_type_id
                        @r = Resource.get_resources_by_resource_type(resource_type_id, @limit, @offset)
                        @response = get_result(200, 'Successfully fetched all resources with resource_type_id:' + resource_type_id, @r.count, @limit, @offset)
                        @param = 'resource_type_id=' + resource_type_id + '&'

                    elsif licence_id
                        @r = Resource.get_resources_by_licence_id(licence_id, @limit, @offset)
                        @response = get_result(200, 'Successfully fetched all resources with licence_id:' + licence_id, @r.count, @limit, @offset)
                        @param = 'licence_id=' + licence_id + '&'

                    elsif tag_id
                        @r = Tag.find(tag_id).resources.get_resources_by_tag_id(tag_id, @limit, @offset) 
                        @response = get_result(200, 'Successfully fetched all resources with tag_id:' + tag_id, @r.count, @limit, @offset)
                        @param = 'tag_id=' + tag_id + '&'

                    else
                        @r = Resource.get_all_resources(@limit, @offset)
                        
                        # Ful Lösnig!!!!!
                        if @r.count < 10
                            @next = nil
                        end
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
                        t = Tag.find(tag)
                        if t
                            @r.tags << t
                        end
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

                        t = Tag.find(tag)
                        if t && !@r.tags.exists?(tag)
                            @r.tags << t
                        end
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


            # CrossDomain
            #def options
             #   set_headers
                # this will send an empty request to the clien with 200 status code (OK, can proceed)
              #  render :text => '', :content_type => 'text/plain'
            #end

            private
            # Set CORS
            #def set_headers
             #   headers['Access-Control-Allow-Origin'] = '*'
              #  headers['Access-Control-Expose-Headers'] = 'Etag'
               # headers['Access-Control-Allow-Methods'] = 'GET, POST, PUT, DELETE, PATCH, OPTIONS, HEAD'
                #headers['Access-Control-Allow-Headers'] = '*, x-requested-with, Content-Type, If-Modified-Since, If-None-Match, Authorization'
               # headers['Access-Control-Max-Age'] = '86400'
            #end

            # Prevent mass assagniment
            def resource_params
                params.require(:resource).permit(:title, :desciption, :url, :user_id, :resource_type_id, :licence_id, :tags)
            end

        end
    end
end