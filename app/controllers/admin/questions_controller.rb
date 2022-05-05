class Admin::QuestionsController < ApplicationController
  def new
    @question = Question.new
    @question.question_contents = (0..4).map do |r|
      QuestionContent.new
    end
  end

  def create
    question = Question.new(title: params[:question][:title])
    question.admin_id = current_admin.id
    if question.save

      (0..4).each do |index|
        question.question_contents.create(
          content: params[:question][:content][index.to_s],
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
    # @question.question_contents = (0..4).map do |r|
    #   QuestionContent.find(params[:id])
    # end
  end

  def update
    question = Question.find(params[:id])
    if question.update!(title: params[:question][:title])
      question.question_contents.each_with_index do |question_content,i|
         question_content.update(
          content: params[:question][:content][i.to_s],
          answer: params[:question][:answer][i.to_s]
        )
      end
    end
    redirect_to admin_question_path(question.id)
  end

  def destroy
    question = Question.find(params[:id])
    question.destroy
    redirect_to admin_homes_top_path
  end

  private

  def question_params
    params.require(:question).permit(:title)
  end

end
