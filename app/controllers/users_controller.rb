class UsersController < ApplicationController

    def index
        render json: User.all
    end


    # def show
    #     user = User.find_by(username: params[:username])
    #     render json: user
    #     byebug
    # end

    def create
        
      user = User.find_by(username: params[:username])
        if user
            token_user = generate_token({id: user.id})
            resp_token = { 
                user: user_serializer(user),
                jwt: token_user
                }
            session[:user_id] = user.id
            byebug
            render json: {token: resp_token}
            
        elsif 
            @user = User.new(user_params)
              if @user.save
                token_user = generate_token({id: @user.id})   
                session[:user_id] = user.id
                #window.localStorage.setItem('current_user': token_user)
                resp_token = { 
                    user: user_serializer(@user),
                    jwt: token_user
                  }
                byebug
                render json: {token: resp_token}
                #byebug
            else 
                resp = {
                    error: "Cannot create User"
                }
                render json: resp
            end
          end
        end
    


    # def destroy
    #     reset_session
    #     byebug
    # end
    
    private
   
    def user_params 
        params.require(:user).permit(:name, :username)
    end
end
