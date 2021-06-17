class ApplicationController < ActionController::API
  include ActionController::Cookies
#   include ActionController::RequestForgeryProtection
#   protect_from_forgery with: :exception


include ActionController::Serialization
    def logged_in?
        
         User.find_by(id: JWT.decode(request.headers["Authorization"], jwt_secret)[0]["id"])
        byebug
     end

    def decode_token_for_user_id(token_info)
        User.find_by(id: JWT.decode(token_info, jwt_secret)[0]["id"])
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
        JWT.encode(info, jwt_secret)
    end


    def grab_current_user
        
        if User.find_by(id: JWT.decode(request.headers["Authorization"], 'dingdingers')[0]["id"])
            byebug
            render json: {
              user: user_serializer(decode_token_for_user_id(request.headers["Authorization"]))
             }, status: :ok
         else
             render json: {error: "No current user"}
         end
    end
    private

        def jwt_secret
             return 'dingdingers'
        end 
end
