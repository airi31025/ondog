class Admin::HomesController < ApplicationController
  def top
    @questions = Question.page(params[:page]).order(created_at: :desc)
  end
end
