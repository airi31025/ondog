class User::QuestionsController < ApplicationController
  def index
    @questions = Question.page(params[:page])
  end

  def practice
     @question = Question.find(params[:question_id])
  end

  def test
    @question = Question.find(params[:question_id])
    @question = Question.new
    @question.answer_results = (0..4).map do |r|
      AnswerResult.new
    end
  end

  def create
    question = Question.new(title: params[:question][:title])
    if question.save
      (0..4).each do |index|
        question.answer_results.create(
          answer: params[:question][:answer][index.to_s]
        )
      end
    end
  end
end
