class User::AnswerResultsController < ApplicationController
  CONGRATS_EXP = 5
  def create
    @question = Question.find(params[:question_id])

    @question.question_contents.each_with_index do |content, index|
      if content.answer != params[:answers][index]
        flash.now[:notice] = "不正解です。もう一度勉強しましょう！"
        return render 'user/questions/practice'
      end
    end
    redirect_to user_answer_results_congrats_path(question_id: @question.id)
  end


  def congrats

    @pet = current_user.pet
    @question = Question.find(params[:question_id])

    totalexp = @pet.exp
    totalexp += CONGRATS_EXP
    if totalexp > 10000
      totalexp = 10000
    end

    @pet.exp = totalexp
    @pet.update(exp: totalexp)

    if @pet.level > 50
      search_key = 50
    else
      search_key = @pet.level
    end
    # binding.pry

    # levelsetting = LevelSetting.find_by(level: 20);
    levelsetting = LevelSetting.find_by(level: search_key+1);
  # binding.pry
    if levelsetting && levelsetting.threshold <= @pet.exp
      @pet.level = @pet.level+1
      @pet.update(level: @pet.level)
    end

    @explevel = [0,0,10,21,33,46,60,75,92,111,132,155,180,208,239,273,310,351,396,446,501,562,629,703,784,873,971,1079,1198,1329,1473,1631,1805,1996,2206,2437,2691,2970,3277,3615,3987,4396,4846,5341,5886,6486,7146,7872,8671,9550,10000]

  end
end
