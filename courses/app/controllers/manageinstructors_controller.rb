class ManageinstructorsController < ApplicationController
  before_action :set_course
  def new
    course= Course.find(params[:course_id])
    @manageinstructor=course.manageinstructors.build
  end

  def create
    @manageinstructor = Manageinstructor.new(priceandcoupon_params)
    course= Course.find(params[:course_id])

    respond_to do |format|
      if @manageinstructor.save
        if course.instructoridlist ==nil
          course.instructoridlist=""
        end
        course.instructoridlist=course.instructoridlist+","+@manageinstructor.id.to_s
        course.save

        format.html { redirect_to "/courses/"+@course.id.to_s+"/coursefeedbacks/new", notice: 'Course was successfully updated.' }

      else
        format.html { render :new }
        format.json { render json: @question.errors, status: :unprocessable_entity }
      end
    end
  end



  # Never trust parameters from the scary internet, only allow the white list through.

  def set_course
    @course=Course.find(params[:course_id])
  end
  def priceandcoupon_params
    params.require(:manageinstructor).permit(:all)
  end
end
