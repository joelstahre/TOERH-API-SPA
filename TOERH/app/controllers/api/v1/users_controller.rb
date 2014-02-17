module Api
    module V1
        class UsersController < ApplicationController
            before_filter :restrict_access

            respond_to :json, :xml

            def index

                begin
                    u = User.all
                    result = get_result(201, 'Successfully fetched all Users', u)
                rescue
                    result = get_result(500, 'Faild to fetch all Users', u)
                end

                respond_format(result)
            end

            def show
                begin
                    u = User.find(params[:id])
                    result = get_result(201, 'Successfully fetched User', u)
                rescue
                    result = get_result(500, 'Faild to find User', u)
                end

                respond_format(result)
            end

            def create
                begin
                    u = User.new(user_params)

                    if u.save
                        result = get_result(201, 'User successfully created', u)
                    else
                        result = get_result(500, 'Faild to create User', u)
                    end

                rescue
                    result = get_result(500, 'Faild to create User', u)
                end

                respond_format(result)
            end

            def update

                begin
                    u = User.find(params[:id])
                    
                    if u.update(user_params)
                        result = get_result(201, 'User successfully updated', u)
                    else
                        result = get_result(500, 'Faild to update user', u)
                    end

                rescue
                    result = get_result(500, 'Faild to find user', r)
                end

                respond_format(result)
            end

            def destroy
                begin
                    u = User.find(params[:id])

                    if u.destroy
                        result = get_result(201, 'User successfully deleted', u)
                    else
                        result = get_result(500, 'Faild to delete User', u)
                    end

                rescue
                    result = get_result(500, 'Faild to find User', u)
                end

                respond_format(result)
            end


            private 

            # Prevent mass assagniment
            def user_params
                params.require(:user).permit(:first_name, :last_name, :email)
            end

        end
    end
end