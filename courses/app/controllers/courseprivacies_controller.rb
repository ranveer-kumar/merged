class CourseprivaciesController < ApplicationController
  before_action :set_course
  def new
    course= Course.find(params[:course_id])
    @courseprivacy=course.courseprivacies.build
  end

  def create
    @courseprivacy = Courseprivacy.new(courseprivacy_params)
    course= Course.find(params[:course_id])

    respond_to do |format|
      if @courseprivacy.save
        if course.privacy_level==nil
          course.privacy_level=""
        end
        course.privacy_level=@courseprivacy.id
        course.save

        format.html { redirect_to "/courses/"+@course.id.to_s+"/priceandcoupons/new", notice: 'Course was successfully updated.' }

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
  def courseprivacy_params
    params.require(:courseprivacy).permit(:all)
  end
end
