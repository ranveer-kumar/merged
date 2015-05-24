class LearningObjectivesController < ApplicationController
  before_action :set_course, only: [:show, :edit, :update, :destroy]

  # GET /learningobjectives
  # GET /learningobjectives.json
  def index
    @Courses = Course.all
  end

  # GET /learningobjectives/1
  # GET /learningobjectives/1.json
  def show
  end

  # GET /learningobjectives/index
  def new
    @Course = Course.new
  end

  # GET /learningobjectives/1/edit
  def edit
  end

  # POST /learningobjectives
  # POST /learningobjectives.json
  def create
    @Course = Course.new(course_params)

    respond_to do |format|
      if @Course.save
        format.html { redirect_to @Course, notice: 'Course was successfully created.' }
        format.json { render :show, status: :created, location: @Course }
      else
        format.html { render :index }
        format.json { render json: @Course.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /learningobjectives/1
  # PATCH/PUT /learningobjectives/1.json
  def update
    respond_to do |format|
      if @Course.update(course_params)
        format.html { redirect_to @Course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @Course }
      else
        format.html { render :edit }
        format.json { render json: @Course.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /learningobjectives/1
  # DELETE /learningobjectives/1.json
  def destroy
    @Course.destroy
    respond_to do |format|
      format.html { redirect_to Courses_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_Course
      @Course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:Course).permit(:title, :subtitle, :objectives, :language_id, :category_id, :subactegory_id, :level_id, :certificate, :lectures, :privacy_level)
    end
end
