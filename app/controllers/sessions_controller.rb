class SessionsController < ApplicationController
    def new
    end
    
    def create
         user = User.find_by(email: params[:email]) 
        
            if user && user.authenticate(params[:password])
                session[:user_id] = user.id
                redirect_to user_path(user)
            else
                # return head(:forbidden) 
                flash.now[:notice] = "Invalid email or password. Try again "
                 render :new
            end 
    end
    def omniauthcreate
       
        user = User.find_or_create_by(uid: auth['uid']) do |u|
          u.name = auth['info']['name']
          u.email = auth['info']['email']
          u.password = u.password_confirmation = SecureRandom.base58(24)
          u.provider = auth['provider']
          
        end
        # raise request.env['omniauth.auth']
        session[:user_id] = user.id
        # raise params.inspect
        redirect_to user_path(user)
        
      end

    def show
        if User.find_by(username: params[:name]) 
        user = User.find_by(username: params[:name]) 
        session[:user_id] = user.id
        end
    end

    def destroy
        session.delete :user_id
        
        redirect_to '/'
      end
      private 
      def auth
        request.env['omniauth.auth']
      end

      
      
end