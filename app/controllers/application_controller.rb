class ApplicationController < ActionController::API
  include ActionController::Cookies
#   include ActionController::RequestForgeryProtection
#   protect_from_forgery with: :exception

include ActionController::Serialization
    def logged_in?
        session[:user_id] || User.find_by(id: JWT.decode(request.headers["Authorization"],'dingding')[0]["id"])
     end

    def decode_token_for_user_id(token_info)
        User.find_by(id: JWT.decode(token_info,'dingding')[0]["id"])
       # byebug #request.headers["Authorization"]
    end

    # def currenten_user
    #    @currenten_user ||= User.find_by(id: decode_token_for_user_id)
    # end

    def user_serializer(user)
        
           {name: user.name,
            username: user.username,
            id: user.id}
        
    end

    def generate_token(info)
        JWT.encode(info, "dingding")
    end


    def grab_current_user
        if logged_in?
            render json: {
              user: user_serializer(decode_token_for_user_id(request.headers["Authorization"]))
             }, status: :ok
         else
             render json: {error: "No current user"}
         end
    end
end
