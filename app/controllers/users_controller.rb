class UsersController < ApplicationController

    def index
        render json: User.all
    end

    # def create
    #     user = User.new(user_params)
    #     if user.save
    #         render json: user
    #         byebug
    #     end
    # end

    def create
        user = User.find_by(username: params[:username])
        if user
            session[:user_id] = user.id
            render json: user
        else 
            user = User.new(user_params)
            if user.save
            session[:user_id] = user.id
            render json: user
            byebug
        end
      end
    end


    def destroy
        reset_session
    end
    
    private
   
    def user_params 
        params.require(:user).permit(:name, :username)
    end
end
