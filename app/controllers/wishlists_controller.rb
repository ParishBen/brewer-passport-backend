class WishlistsController < ApplicationController

    def index
        user = User.find_by(username: params[:id])
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
            wishlist.user_id = User.find_by(username: params[:username]).id
            user =  User.find_by(username: params[:username])
            if !user.wishlists.find_by(name: params[:name])
            wishlist.save
            render json: wishlist
            
        
      end
    end


    # def destroy
        
    #     byebug
    # end
    
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
