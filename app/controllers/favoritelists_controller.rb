class FavoritelistsController < ApplicationController
   

        def index
            user = User.find_by(username: params[:username])
            if user      
            render json: user.favoritelists.all.to_json
            # else 
            #     render json: Favoritelist.all.to_json
        end
    end
    
     
     
        def create
            
            
                favoritelist = Favoritelist.new(favoritelist_params)
                user =  User.find_by(username: params[:username])
                favoritelist.user_id = user.id
                # if !current_user
                #     session[:user_id] = user.id
                if !user.favoritelists.find_by(name: params[:name])
                favoritelist.save
                render json: favoritelist.to_json
            else 
                resp = {
                    error: "#{params[:name]} is already in Favorites!"
                    }
                render json: resp, status: :unauthorized
            
         
            end
          end
        #end
    
    
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
    
        # def current_user
        #     User.find_by(id: session[:user_id])
        # end
    
    
    
end
