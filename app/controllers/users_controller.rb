class UsersController < ApplicationController
  # before_action :require_logged_in
  # skip_before_action :require_logged_in, only: [:create, :new]

  def index
    users = User.all
    render json: UserSerializer.new(users)
  end

  def new
      @user = User.new

  end

  
  
  
  def show
      # raise params.inspect

      # if current_user.id.to_s == params[:id]
      
      @user = User.find(params[:id])
      
      # raise current_user.inspect
      # else 
      #     redirect_to '/' 
      #     flash.now[:notice] = "the session hash's user instance does not match with the params user id"
      
      # end
  end
  
  def create
      @user = User.new(user_params)
      @user.save!
      # session[:user_id] = @user.id
      redirect_to user_path(@user)
  end
   private
  def user_params
          params.require(:user).permit!
  end

  
end