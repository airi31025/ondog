class User::QuestionsController < ApplicationController
  def index
    @questions = Question.page(params[:page])
  end

  def practice
     @question = Question.find(params[:id])
  end

  def test
  end
end
