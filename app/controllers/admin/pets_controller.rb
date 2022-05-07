class Admin::PetsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @pet = Pet.find(params[:id])
    @explevel = [0,0,10,21,33,46]
    @user = @pet.user
  end
end
