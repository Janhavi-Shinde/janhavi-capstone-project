class SpheresController < ApplicationController
  # before_action :require_logged_in
  def new
      
      user = User.find(params[:user_id])
     
      if user
        #&& user == current_user

          @sphere = user.spheres.build
          
      else 
          redirect_to '/'
          # render to error page
          # render "no user exists"
      end
  end

  def index
    spheres = Sphere.all
    render json: SphereSerializer.new(spheres)

  end

  def edit
      @sphere = Sphere.find(params[:id])
  end

  def update
  
      @sphere = Sphere.find(params[:id])
      if @sphere.update(sphere_params)
      redirect_to user_path(@sphere.user_id)
      else 
          render :edit
      end
  end

  def create
      @sphere = Sphere.new(sphere_params)
     if @sphere.valid?
      @sphere.save       
       redirect_to @sphere
     else 
      render :new

     end
          

  end

  
  def show
      sphere = Sphere.find(params[:id])
      options = {
    include: [:user, :goals]
  }
    #   # @user = current_user.id
    #   if sphere
    #       @sphere = sphere
    #   else
    #       # redirect_to user_path(current_user.id)
           
    #       render text: "No such sphere exists"
    #       # won't let me redirect for some reason
    #   end

    render json: SphereSerializer.new(sphere, options)
     
  end

  def destroy
      @sphere = Sphere.find(params[:id])
      @sphere.destroy
      user = @sphere.user_id
      # flash[:notice] = "Sphere deleted."
      redirect_to user_path(user)
      
  end
  private

  def sphere_params
      params.require(:sphere).permit(:title, :user_id)
  end
end
