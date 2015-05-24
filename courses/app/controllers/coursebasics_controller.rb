class CoursebasicsController < ApplicationController
  before_action :set_course
  def update
    @course.update(course_params)
    respond_to do |format|

      if @course.save
        format.html { redirect_to "/courses/"+@course.id.to_s+"/lessons/new
", notice: 'Course was successfully updated.' }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end

    end
  end
  # Use callbacks to share common setup or constraints between actions.
  def set_course
    @course = Course.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def course_params
    params.require(:coursebasics).permit(:title,:subtitle,:language_id,:level_id,:certificate)
  end
end
