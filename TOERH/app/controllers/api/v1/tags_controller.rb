module Api
    module V1
        class TagsController < ApiController
            before_filter :restrict_access
            respond_to :json, :xml

            # GET /api/v1/tags
            # GET /api/v1/resources/:resource_id/tags
            def index

                resource_id = params[:resource_id]

                begin
                    if resource_id
                        @t = Resource.find(resource_id).tags
                        @response = get_result(200, 'Successfully fetched all Tags that belongs to a specific Resource', @t.count)

                    else
                        @t = Tag.all
                        @response = get_result(200, 'Successfully fetched all Tags', @t.count)

                    end
                rescue
                    @response = get_result(500, 'Faild to fetch all Tags')
                end

                render 'API/tags/index'
            end

            # GET /api/v1/tags/:id
            def show
                begin
                    @t = Tag.find(params[:id])
                    @response = get_result(200, 'Successfully fetched Tag')
                rescue
                    @response = get_result(500, 'Faild to fetch Tag')
                end

                render 'API/tags/show'
            end
        end
    end
end