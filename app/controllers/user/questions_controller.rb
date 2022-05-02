class User::QuestionsController < ApplicationController
  def index
    @questions = Question.page(params[:page])
  end

  def practice
     @question = Question.find(params[:question_id])
  end

  def test
    @question = Question.find(params[:question_id])
    @new_question = Question.new
    @new_question.answer_results = (0..4).map do |r|
      AnswerResult.new
    end
  end

  
end
