class WishlistsController < ApplicationController

    def index
        byebug
        user = User.find_by(username: params[:username])
        if user
            
        render json: user.wishlists.all.to_json
    #     else 
    #         render json: Wishlist.all.to_json
    
     end
end

 
    # def show
    #     wishlist = Wishlist.find_by(user_id: params[:user_id])
    #     render json: wishlist
    #     byebug
    # end

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
                    error: "#{params[:name]} is already in Wishlist!",
                    details: wishlist.errors.full_messages
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
