class ApplicationController < ActionController::API
  include ActionController::Cookies
#   include ActionController::RequestForgeryProtection
#   protect_from_forgery with: :exception


include ActionController::Serialization
    def logged_in?
        
         User.find_by(id: JWT.decode(request.headers["Authorization"],JWT_SECRET)[0]["id"])
        #byebug 
     end

    def decode_token_for_user_id(token_info)
        User.find_by(id: JWT.decode(token_info,JWT_SECRET)[0]["id"])
    end

    # def currenten_user
    #    @currenten_user ||= User.find_by(id: decode_token_for_user_id)
    # end

    def user_serializer(user)
        
           {name: user.name,
            username: user.username
            }
        
    end

    def generate_token(info)
        JWT.encode(info,JWT_SECRET)
    end

    def self.grab_session_user
        user = User.find_by(id: session[:user_id])
        if user
            render json: {
                user: user_serializer(user)
            }
        else 
            render json: {
                error: "NO CURRENT SESSION"
            }
        end
    end

    def logout
        session.delete(:user_id)
        render json: {text: "just cleared session"}
    end

    def grab_current_user
        user = decode_token_for_user_id(request.headers["Authorization"])
        if user
            render json: {
              user: user_serializer(decode_token_for_user_id(request.headers["Authorization"]))
             }, status: :ok
         else
            
             render json: {error: "No current user"}
         end
    end
    
end
