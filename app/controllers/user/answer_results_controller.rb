class User::AnswerResultsController < ApplicationController
  CONGRATS_EXP = 5
  def create
    # byebug
    @question = Question.find(params[:question_id])

    @question.question_contents.each_with_index do |content, index|
      if content.answer != params[:answers][index]
        return render 'user/questions/practice'
      end
    end
    redirect_to user_answer_results_congrats_path(question_id: @question.id)
  end

  #   if  question.question_contents_ansers == question.answer_results
  #     redirect_to user_answer_results_congrats
  #   else
  #     render user_question_practice
  #   end
  # end

  def congrats

    @pet = current_user.pet
    @question = Question.find(params[:question_id])

    totalexp = @pet.exp
    totalexp += CONGRATS_EXP

    @pet.exp = totalexp
    @pet.update(exp: totalexp)

    levelsetting = LevelSetting.find_by(level: @pet.level+1);
    if levelsetting.threshold <= @pet.exp
      @pet.level = @pet.level+1
      @pet.update(level: @pet.level)
    end
  end
end
