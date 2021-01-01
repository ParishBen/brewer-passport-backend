class FavoritelistsController < ApplicationController
   

        def index
            user = User.find_by(username: params[:username])
            if user
            render json: user.favoritelists.all
            else 
                render json: Favoritelist.all
        end
    end
    
     
     
        def create
            
            
                favoritelist = Favoritelist.new(favoritelist_params)
                user =  User.find_by(username: params[:username])
                favoritelist.user_id = user.id
                if !user.favoritelists.find_by(name: params[:name])
                favoritelist.save
                render json: favoritelist
                
            
          end
        end
    
    
        def destroy
            user =  User.find_by(username: params[:username])
            brewery = user.favoritelists.find_by(name: params[:name])
            brewery.destroy
            
         end
          
        
        private
       
        def favoritelist_params 
            params.require(:favoritelist).permit(:name, :city, :state, :country, :description, :website, :address, :user_id, :phoneNum,:username)
        end
    
        def logged_in?
            !!session[:user_id]
        end
    
        def current_user
            User.find_by(id: session[:user_id])
        end
    
    
    
end
