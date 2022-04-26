class Admin::QuestionsController < ApplicationController
  def new
    @question = Question.new
  end

  def create
    question = Question.new(question_params)
    question.save
    redirect_to admin_question_path(question.id)
  end

  def show
    @question = Question.find(params[:id])
  end

  def edit
    @question = Question.find(params[:id])
  end

  def update
    question = Question.find(params[:id])
    question.update(question_params)
    redirect_to admin_question_path(question.id)
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to admin_question_path(question.id)
  end

  private
  def question_params
    params.require(:question).permit(:title, :question, :answer)
  end

end
