class Admin::PetsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @pet = Pet.find(params[:id])
    @explevel = [0,0,10,21,33,46,60,75,92,111,132,155,180,208,239,273,310,351,396,446,500]
    @user = @pet.user
  end
end
