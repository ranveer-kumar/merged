class LearningobjectivesController < ApplicationController

  # GET /learningobjectives
  # GET /learningobjectives.json
  def index
    @courses = Course.all
  end

  # GET /learningobjectives/1
  # GET /learningobjectives/1.json
  def show
  end

  # GET /learningobjectives/index
  def new
    @course = Course.new
  end

  # GET /learningobjectives/1/edit
  def edit
  end

  # POST /learningobjectives
  # POST /learningobjectives.json
  def create
    @course = Course.new(course_params)
    respond_to do |format|
    
      if @course.save
        format.html { redirect_to "/coursebasics/"+@course.id.to_s, notice: 'Course was successfully updated.' }
      else
        format.html { render :new }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    
end
  end


def coursebasics
end

  # PATCH/PUT /learningobjectives/1
  # PATCH/PUT /learningobjectives/1.json
  def update
    isSuccess=@course.update(course_params)

    if @course.objectives!=nil
      respond_to do |format|
        if

          format.json { render :coursebasics, status: :ok, location: @course }
        else
          format.html { render :edit }
          #format.json { render json: @course.errors, status: :unprocessable_entity }
        end
        end



    elsif @course.title!=nil
    respond_to do |format|
      if
      format.html { redirect_to @course, notice: 'Course was successfully updated.' }
        format.json { render :show, status: :ok, location: @course }
      else
        format.html { render :edit }
        format.json { render json: @course.errors, status: :unprocessable_entity }
      end
    end

    elsif @course.title!=nil
      respond_to do |format|
        if
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
          format.json { render :show, status: :ok, location: @course }
        else
          format.html { render :edit }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end

    elsif @course.title!=nil
      respond_to do |format|
        if
        format.html { redirect_to @course, notice: 'Course was successfully updated.' }
          format.json { render :show, status: :ok, location: @course }
        else
          format.html { render :edit }
          format.json { render json: @course.errors, status: :unprocessable_entity }
        end
      end


    else


    end

  end


  # DELETE /learningobjectives/1
  # DELETE /learningobjectives/1.json
  def destroy
    @course.destroy
    respond_to do |format|
      format.html { redirect_to course_url, notice: 'Course was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_course
      @course = Course.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def course_params
      params.require(:learningobjectives).permit(:objectives)
    end
end
