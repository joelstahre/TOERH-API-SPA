module Api
    module V1
        class ResourceTypesController < ApiController
            before_filter :restrict_access
            respond_to :json, :xml
            
            # GET /api/v1/resource_types
            def index

                begin
                    @rt = ResourceType.all
                    @response = get_result(200, 'Successfully fetched all Resources Types', @rt.count)

                rescue
                    @response = get_result(500, 'Faild to fetched all Resources Types')
                end

                render 'API/resource_types/index'
            end

            # GET /api/v1/resource_types/:id
            def show

                begin
                    @rt = ResourceType.find(params[:id])
                    @response = get_result(200, 'Successfully fetched Resource Type')
                    
                rescue
                    @response = get_result(500, 'Faild to find Resource Type')
                end

                render 'API/resource_types/show'
            end

        end
    end
end