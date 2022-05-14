class Admin::PetsController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @pet = Pet.find(params[:id])
    @explevel = [0,0,10,21,33,46,60,75,92,111,132,155,180,208,239,273,310,351,396,446,501,562,629,703,784,873,971,1079,1198,1329,1473,1631,1805,1996,2206,2437,2691,2970,3277,3615,3987,4396,4846,5341,5886,6486,7146,7872,8671,9550,10000]
    @user = @pet.user
  end
end
