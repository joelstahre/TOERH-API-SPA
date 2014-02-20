module Api
    module V1
        class UsersController < ApiController
            before_filter :restrict_access
            respond_to :json, :xml

            # GET /api/v1/users
            def index
                search = params[:search]
                @limit = params[:limit] || 10
                @offset = params[:offset] || 0

                begin
                    if search
                        @u = User.find(:all, :conditions => ['last_name LIKE ?', "%#{search}%"])
                        @response = get_result(200, 'Result for your search: ' + search)
                    else
                        @u = User.limit(@limit).offset(@offset).order(id: :desc)
                        @response = get_result(200, 'Successfully fetched all Users', @u.count, @limit, @offset)
                    end
                rescue
                    @response = get_result(500, 'Faild to fetch all Users')
                end

                render "API/users/index"
            end

            # GET /api/v1/users/:id
            def show
                begin
                    @u = User.find(params[:id])
                    @response = get_result(200, 'Successfully fetched User')
                rescue
                    @response = get_result(500, 'Faild to find User')
                end
                
                render "API/users/show"
            end

            # POST /api/v1/users
            def create
                begin
                    @u = User.new(user_params)

                    if @u.save
                        @response = get_result(201, 'User successfully created')
                    else
                        @response = get_result(500, 'Faild to create User')
                    end

                rescue
                    @response = get_result(500, 'Faild to create User')
                end

                render "API/users/create"
            end

            # PUT /api/v1/users/:id
            def update

                begin
                    @u = User.find(params[:id])
                    
                    if @u.update(user_params)
                        @response = get_result(200, 'User successfully updated')
                    else
                        @response = get_result(500, 'Faild to update user')
                    end

                rescue
                    @response = get_result(500, 'Faild to find user')
                end

                render "API/users/update"
            end

            # DELETE /api/v1/users/:id
            def destroy
                begin
                    @u = User.find(params[:id])

                    if @u.destroy
                        @response = get_result(200, 'User successfully deleted')
                    else
                        @response = get_result(500, 'Faild to delete User')
                    end

                rescue
                    @response = get_result(500, 'Faild to find User')
                end

                render 'API/users/destroy'
            end


            private 

            # Prevent mass assagniment
            def user_params
                params.require(:user).permit(:first_name, :last_name, :email)
            end

        end
    end
end