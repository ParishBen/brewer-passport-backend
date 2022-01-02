class WishlistsController < ApplicationController

    def index
        
        user = User.find_by(username: params[:username])
        if user
            
        render json: user.wishlists.all.to_json
    #     else 
    #         render json: Wishlist.all.to_json
    
     end
end

 
    def show
        #byebug
        user = User.find_by(username: request.headers["Authorization"])
        wishlist = user.wishlists.find_by(name: params[:name])
        resp = {
            brewery: wishlist
        }
        render json: resp
        #byebug
    end

    def create
        
        
            wishlist = Wishlist.new(wishlist_params)
            user =  User.find_by(username: params[:username])
            wishlist.user_id = user.id
            # if !current_user
            #     session[:user_id] = user.id
            if !user.wishlists.find_by(name: params[:name])
            wishlist.save
            
            render json: wishlist.to_json
            else 
                resp = {
                    error: "#{params[:name]} is already in Wishlist!"
                    }
                render json: resp, status: :unauthorized
            
         end
      end
    #end


    def destroy
        user =  User.find_by(username: params[:username])
        brewery = user.wishlists.find_by(name: params[:name])
        
            
        brewery.destroy
        
    end
       
    
    private
   
    def wishlist_params 
        params.require(:wishlist).permit(:name, :city, :state, :country, :description, :website, :address, :user_id, :phoneNum,:username)
    end

    def logged_in?
        !!session[:user_id]
    end

    # def current_user
    #     User.find_by(id: session[:user_id])
    # end

end
