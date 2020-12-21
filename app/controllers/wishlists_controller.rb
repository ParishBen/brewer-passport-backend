class WishlistsController < ApplicationController

    def index
        render json: Wishlist.all
    end

    # def create
    #     user = User.new(user_params)
    #     if user.save
    #         render json: user
    #         byebug
    #     end
    # end
    def show
        wishlist = Wishlist.find_by(user_id: params[:user_id])
        render json: wishlist
        byebug
    end

    def create
        #wishlist = Wishlist.find_by(username: params[:username])
        
            wishlist = Wishlist.new(wishlist_params)
            wishlist.user_id = User.find_by(username: params[:username]).id
             
            if wishlist.save
            
            render json: wishlist
            else byebug
        
      end
    end


    def destroy
        
        byebug
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
