class Admin::QuestionsController < ApplicationController
  def new
    @question = Question.new
  end
  
  def create
    question = Question.new(question_params)
    question.save
    redirect_to admin_question_path
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
  end
  
  private
  def question_params
    params.require(:question).permit(:title, :question, :answer)
  end
  
end
