class Admin::QuestionsController < ApplicationController
  def new
    @question = Question.new
    @question.question_contents = (0..4).map do |r|
      QuestionContent.new
    end
  end

  def create
    question = Question.new(title: params[:question][:title])
    if question.save
      (0..4).each do |index|
        question.question_contents.create(
          content: params[:question][:question][index.to_s],
          answer: params[:question][:answer][index.to_s]
        )
      end
    end
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
