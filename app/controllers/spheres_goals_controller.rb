class SpheresGoalsController < ApplicationController
  before_action :set_spheres_goal, only: %i[ show edit update destroy ]

  # GET /spheres_goals or /spheres_goals.json
  def index
    @spheres_goals = SpheresGoal.all
  end

  # GET /spheres_goals/1 or /spheres_goals/1.json
  def show
  end

  # GET /spheres_goals/new
  def new
    @spheres_goal = SpheresGoal.new
  end

  # GET /spheres_goals/1/edit
  def edit
  end

  # POST /spheres_goals or /spheres_goals.json
  def create
    @spheres_goal = SpheresGoal.new(spheres_goal_params)

    respond_to do |format|
      if @spheres_goal.save
        format.html { redirect_to spheres_goal_url(@spheres_goal), notice: "Spheres goal was successfully created." }
        format.json { render :show, status: :created, location: @spheres_goal }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spheres_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spheres_goals/1 or /spheres_goals/1.json
  def update
    respond_to do |format|
      if @spheres_goal.update(spheres_goal_params)
        format.html { redirect_to spheres_goal_url(@spheres_goal), notice: "Spheres goal was successfully updated." }
        format.json { render :show, status: :ok, location: @spheres_goal }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spheres_goal.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spheres_goals/1 or /spheres_goals/1.json
  def destroy
    @spheres_goal.destroy

    respond_to do |format|
      format.html { redirect_to spheres_goals_url, notice: "Spheres goal was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spheres_goal
      @spheres_goal = SpheresGoal.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spheres_goal_params
      params.require(:spheres_goal).permit(:goal_id, :sphere_id)
    end
end
