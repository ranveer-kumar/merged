class LessonsController < ApplicationController
 before_action :set_course
  # GET /lessons
  # GET /lessons.json
  def index
    @lessons = Lesson.all
  end

  # GET /lessons/1
  # GET /lessons/1.json
  def show
  end

  # GET /lessons/index
  def new
    course= Course.find(params[:course_id])
    @lesson=course.lessons.build
  end

  # GET /lessons/1/edit
  def edit
  end

  # POST /lessons
  # POST /lessons.json
  def create
    @lesson = Lesson.new(lesson_params)
    course= Course.find(params[:course_id])

    respond_to do |format|
      if @lesson.save
        if course.lectures==nil
          course.lectures=""
        end
        course.lectures=course.lectures+","+@lesson.id.to_s
        course.save

        format.html { redirect_to "/courses/"+@course.id.to_s+"/coursephotos/new", notice: 'Course was successfully updated.' }

      else
        format.html { render :new }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /lessons/1
  # PATCH/PUT /lessons/1.json
  def update
    respond_to do |format|
      set_lesson
      if @lesson.update(lesson_params)
        format.html { redirect_to @lesson, notice: 'Lesson was successfully updated.' }
        format.json { render :show, status: :ok, location: @lesson }
      else
        format.html { render :edit }
        format.json { render json: @lesson.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /lessons/1
  # DELETE /lessons/1.json
  def destroy
    @lesson.destroy
    respond_to do |format|
      format.html { redirect_to lessons_url, notice: 'Lesson was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_lesson
      @lesson = Lesson.find(params[:lessonid])
    end

  def set_course
    @course=Course.find(params[:course_id])
  end

    # Never trust parameters from the scary internet, only allow the white list through.
    def lesson_params
      params.require(:lesson).permit(:title,:description,:level_id, :contenturl)
    end
end
