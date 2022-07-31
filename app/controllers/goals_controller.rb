class GoalsController < ApplicationController
  def new
      @goal = Goal.new

      @spheres = current_user.spheres.all
  end

  def create
      @goal = Goal.new(goals_params)
      if @goal.valid?
      @goal.save
       redirect_to goal_path(@goal)
      else
          render :new
      end
  end
  def destroy
      @goal = Goal.find(params[:id])
      @goal.destroy
    
      sphere_id = SpheresGoal.find_by(goal_id: @goal.id).sphere_id
      redirect_to sphere_path(sphere_id) 
       
  end
  
  def edit
      @goal = Goal.find(params[:id])
    #   @spheres = current_user.spheres.all
    #   @current_user = current_user
  end

  def update
      @goal = Goal.find(params[:id])
      if @goal.update(goals_params)

      sphere_id = SpheresGoal.find_by(goal_id: @goal.id).sphere_id
      redirect_to sphere_path(sphere_id)
      else
          render :edit

      end
  end

  def show
      goal = Goal.find(params[:id])
      options = {
    include: [:spheres]
  }
      render json: GoalSerializer.new(goal, options)

  end
  def index
    goals = Goal.all
    options = {
    include: [:spheres]
  }
    render json: GoalSerializer.new(goals, options)
end
  private
  def goals_params
      params.require(:goal).permit(:title, :description, sphere_ids:[])
  end

end
