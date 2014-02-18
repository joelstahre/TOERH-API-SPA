module Api
    module V1
        class UsersController < ApiController
            before_filter :restrict_access

            respond_to :json, :xml

            def index

                begin
                    @u = User.all
                    result = get_result(201, 'Successfully fetched all Users')
                rescue
                    result = get_result(500, 'Faild to fetch all Users')
                end

                render "users/index"
            end

            def show
                begin
                    @u = User.find(params[:id])
                    @result = get_result(201, 'Successfully fetched User')
                rescue
                    @result = get_result(500, 'Faild to find User')
                end

                render "users/show"
            end

            def create
                begin
                    @u = User.new(user_params)

                    if @u.save
                        result = get_result(201, 'User successfully created')
                    else
                        result = get_result(500, 'Faild to create User')
                    end

                rescue
                    result = get_result(500, 'Faild to create User')
                end

                render "users/create"
            end

            def update

                begin
                    @u = User.find(params[:id])
                    
                    if @u.update(user_params)
                        result = get_result(201, 'User successfully updated')
                    else
                        result = get_result(500, 'Faild to update user')
                    end

                rescue
                    result = get_result(500, 'Faild to find user')
                end

                render "users/update"
            end

            def destroy
                begin
                    @u = User.find(params[:id])

                    if @u.destroy
                        result = get_result(201, 'User successfully deleted')
                    else
                        result = get_result(500, 'Faild to delete User')
                    end

                rescue
                    result = get_result(500, 'Faild to find User')
                end

                render 'users/destroy'
            end


            private 

            # Prevent mass assagniment
            def user_params
                params.require(:user).permit(:first_name, :last_name, :email)
            end

        end
    end
end