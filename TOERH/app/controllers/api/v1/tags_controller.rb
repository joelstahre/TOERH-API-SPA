module Api
    module V1
        class TagsController < ApiController

            before_filter :restrict_access

            respond_to :json, :xml

            def index

                begin
                    @t = Tag.all
                    @response = get_result(200, 'Successfully fetched all Tags')
                rescue
                    @response = get_result(500, 'Faild to fetch all Tags')
                end

                render 'API/tags/index'
            end

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