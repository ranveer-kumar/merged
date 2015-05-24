class CoursephotosController < ApplicationController
  before_action :set_course
  def new
    course= Course.find(params[:course_id])
    @coursephoto=course.coursephotos.build
  end

  def create
    @coursephoto = Coursephoto.new(coursephoto_params)
    course= Course.find(params[:course_id])

    respond_to do |format|
      if @coursephoto.save
        course.coursephoto=@coursephoto.id
        course.save

        format.html { redirect_to "/courses/"+@course.id.to_s+"/questions/new", notice: 'Course was successfully updated.' }

      else
        format.html { render :new }
        format.json { render json: @coursephoto.errors, status: :unprocessable_entity }
      end
    end
  end

  def set_course
    @course = Course.find(params[:course_id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.

  def set_course
    @course=Course.find(params[:course_id])
  end
  def coursephoto_params
    params.require(:coursephoto).permit(:photourl)
  end
end
