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
    def show
        user = User.find_by(username: params[:username])
        render json: user
        byebug
    end

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
            
        end
      end
    end


    def destroy
        reset_session
        byebug
    end
    
    private
   
    def user_params 
        params.require(:user).permit(:name, :username)
    end

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find_by(id: session[:user_id])
    end
end
