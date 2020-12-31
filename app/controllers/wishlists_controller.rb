class WishlistsController < ApplicationController

    def index
        user = User.find_by(username: params[:username])
        if user
        render json: user.wishlists.all
        else 
            render json: Wishlist.all
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
            if !user.wishlists.find_by(name: params[:name])
            wishlist.save
            render json: wishlist
            
        
      end
    end


    def destroy
        user =  User.find_by(username: params[:username])
        wishlist = user.wishlists
        brewery = user.wishlists.find_by(name: params[:name])
        if params[:name].split(' ').include?("&")
            newname = params[:name].gsub('&', '\&')
            brewery = user.wishlists.find_by(name: newname)
            #byebug
        brewery.destroy
        
        end
        brewery.destroy
    end
    
    private
   
    def wishlist_params 
        params.require(:wishlist).permit(:name, :city, :state, :country, :description, :website, :address, :user_id, :phoneNum,:username)
    end

    def logged_in?
        !!session[:user_id]
    end

    def current_user
        User.find_by(id: session[:user_id])
    end

end
