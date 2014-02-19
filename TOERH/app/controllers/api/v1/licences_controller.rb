module Api
    module V1
        class LicencesController < ApiController
            before_filter :restrict_access

            respond_to :json, :xml

            def index

                begin
                    @l = Licence.all
                    @response = get_result(200, 'Successfully fetched all Licences')
                rescue
                    @response = get_result(500, 'Faild to fetch all Licences')
                end

                render 'API/licences/index'

            end

            # GET/id
            def show

                begin
                    @l = Licence.find(params[:id])
                    @response = get_result(200, 'Successfully fetched Licence')
                rescue
                    @response = get_result(500, 'Faild to find Licence')
                end

                render 'API/licences/show'
            end

        end
    end
end