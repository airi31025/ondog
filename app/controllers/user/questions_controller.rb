class User::QuestionsController < ApplicationController
  def index
    @questions = Question.page(params[:page])
  end

  def practice
     @question = Question.find(params[:question_id])
  end

  def test
    @question = Question.find(params[:question_id])
    @answer_result = AnswerResult.new
  end
  
  
end
