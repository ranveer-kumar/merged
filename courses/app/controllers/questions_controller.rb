class QuestionsController < ApplicationController
  before_action :set_course
  def new
    course= Course.find(params[:course_id])
    @question=course.questions.build
  end

  def create
    @question = Question.new(question_params)
    course= Course.find(params[:course_id])

    respond_to do |format|
      if @question.save
        if course.questionslist ==nil
          course.questionslist=""
        end
        course.questionslist=course.questionslist+","+@question.id.to_s
        course.save

        format.html { redirect_to "/courses/"+@course.id.to_s+"/courseprivacies/new", notice: 'Course was successfully updated.' }

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
  def question_params
    params.require(:question).permit(:all)
  end
end
