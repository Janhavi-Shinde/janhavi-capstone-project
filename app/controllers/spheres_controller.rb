class SpheresController < ApplicationController
  before_action :set_sphere, only: %i[ show edit update destroy ]

  # GET /spheres or /spheres.json
  def index
    @spheres = Sphere.all
  end

  # GET /spheres/1 or /spheres/1.json
  def show
  end

  # GET /spheres/new
  def new
    @sphere = Sphere.new
  end

  # GET /spheres/1/edit
  def edit
  end

  # POST /spheres or /spheres.json
  def create
    @sphere = Sphere.new(sphere_params)

    respond_to do |format|
      if @sphere.save
        format.html { redirect_to sphere_url(@sphere), notice: "Sphere was successfully created." }
        format.json { render :show, status: :created, location: @sphere }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @sphere.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spheres/1 or /spheres/1.json
  def update
    respond_to do |format|
      if @sphere.update(sphere_params)
        format.html { redirect_to sphere_url(@sphere), notice: "Sphere was successfully updated." }
        format.json { render :show, status: :ok, location: @sphere }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @sphere.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spheres/1 or /spheres/1.json
  def destroy
    @sphere.destroy

    respond_to do |format|
      format.html { redirect_to spheres_url, notice: "Sphere was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sphere
      @sphere = Sphere.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def sphere_params
      params.require(:sphere).permit(:title, :user_id, :goal_aim, :aim_achieved)
    end
end
