class PriceandcouponsController < ApplicationController
  before_action :set_course
  def new
    course= Course.find(params[:course_id])
    @priceandcoupon=course.priceandcoupons.build
  end

  def create
    @priceandcoupon = Priceandcoupon.new(priceandcoupon_params)
    course= Course.find(params[:course_id])

    respond_to do |format|
      if @priceandcoupon.save
        if course.priceandcoupon_id ==nil
          course.priceandcoupon_id=""
        end
        course.priceandcoupon_id=@priceandcoupon.id.to_s
        course.save

        format.html { redirect_to "/courses/"+@course.id.to_s+"/manageinstructors/new", notice: 'Course was successfully updated.' }

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
    params.require(:priceandcoupon).permit(:all)
  end
end
